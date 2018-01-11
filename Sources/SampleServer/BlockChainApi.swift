import Foundation

// blockchainの動きをviewで表示するためのエンドポイントの仮実装
class BlockChainApi {
    let blockchain: BlockChain

    init(dateProvider: DateProvider) {
        blockchain = BlockChain(dateProvider: dateProvider)
    }
    
    func createTransaction(sender: String, recipient: String, amount: Int) -> Int {
        return blockchain.createTransaction(sender:sender, recipient:recipient, amount:amount)
    }

    func mine() -> Block {
        let lastBlock = blockchain.lastBlock
        let lastProof = lastBlock.proof
        let proof = BlockChain.proofOfWork(lastProof: lastProof)

        // 採掘報酬
        blockchain.createTransaction(sender: "0", recipient: "miner", amount: 1)

        return blockchain.createBlock(proof: proof)
    }

    func fullChain() -> [Block] {
        return blockchain.chain
    }
}
