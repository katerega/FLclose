const { Web3 } = require('web3');
const web3 = new Web3('https://bsc-dataseed.binance.org'); // Replace with a dedicated node if possible

// Load ABI from a JSON file or define it inline
const ABI = require('./flABI.json'); // Ensure this file exists
const CONTRACT_ADDRESS = "0x8BEf278614FB8CE3414564dAE1FAF416A159935C";
const OWNER_ADDRESS = "0xaCFBAe0b31DC302C339b5d82e62F56c3Dc268D0F"; // Replace with your actual owner address

const contract = new web3.eth.Contract(ABI, CONTRACT_ADDRESS);

// Function to fetch logs with retry logic
async function getLogsWithRetry() {
    let retries = 3;
    while (retries > 0) {
        try {
            const latestBlock = await web3.eth.getBlockNumber();
            const fromBlock = BigInt(latestBlock) - BigInt(10); // Fetch logs from the last 10 blocks
            const toBlock = latestBlock;

            const logs = await web3.eth.getPastLogs({
                address: CONTRACT_ADDRESS,
                fromBlock: web3.utils.toHex(fromBlock),
                toBlock: web3.utils.toHex(toBlock),
            });
            return logs;
        } catch (error) {
            if (error.message.includes('limit exceeded')) {
                console.log('Rate limit exceeded. Retrying in 30 seconds...');
                await new Promise(resolve => setTimeout(resolve, 30000)); // Wait 30 seconds
                retries--;
            } else {
                throw error;
            }
        }
    }
    console.log('Failed to fetch logs after retries. Skipping this cycle.');
    return []; // Return an empty array to avoid crashing the script
}

// Security monitoring functions
async function checkReentrancy() {
    try {
        const logs = await getLogsWithRetry();
        for (const log of logs) {
            if (log.data.includes("call")) {  // Example: Needs refinement for real attack detection
                console.log("⚠️ Potential reentrancy detected!");
                await executePatch("reentrancy");
            }
        }
    } catch (error) {
        console.error("Error checking reentrancy:", error);
    }
}

async function checkFlashloanAttack() {
    try {
        const balanceBefore = BigInt(await web3.eth.getBalance(CONTRACT_ADDRESS));
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait 1 second
        const balanceAfter = BigInt(await web3.eth.getBalance(CONTRACT_ADDRESS));

        if (balanceAfter - balanceBefore > BigInt(web3.utils.toWei('10', 'ether'))) {
            console.log("⚠️ Flash loan attack detected!");
            await executePatch("flashloan");
        }
    } catch (error) {
        console.error("Error checking flashloan attack:", error);
    }
}

async function checkLargeCashout() {
    try {
        const latestBlock = await web3.eth.getBlock('latest', true);
        for (const tx of latestBlock.transactions) {
            if (tx.to === OWNER_ADDRESS && BigInt(tx.value) > BigInt(web3.utils.toWei('5', 'ether'))) {
                console.log("⚠️ Large cashout detected!");
                await executePatch("large_cashout");
            }
        }
    } catch (error) {
        console.error("Error checking large cashout:", error);
    }
}

// Patch execution function
async function executePatch(issue) {
    console.log(`🔧 Applying patch for ${issue}...`);
    await patchContract(issue);
}

async function patchContract(issueType) {
    try {
        const tx = await contract.methods.applyPatch(issueType).send({ from: OWNER_ADDRESS });
        console.log(`✅ Patch for ${issueType} applied successfully! Tx Hash: ${tx.transactionHash}`);
    } catch (error) {
        console.error(`❌ Error applying patch for ${issueType}:`, error);
    }
}

// Monitoring loop
(async function monitor() {
    while (true) {
        await checkReentrancy();
        await checkFlashloanAttack();
        await checkLargeCashout();
        await new Promise(resolve => setTimeout(resolve, 300000)); // Check every 5 minutes
    }
})();
