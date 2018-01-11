import Foundation
import Kitura
import LoggerAPI

let router = Router()

let blockChainApi = BlockChainApi(dateProvider: DefaultDateProvider())

router.all(middleware: BodyParser())
router.post("/transactions/new") { request, response, next in

    guard let json = request.body?.asJSON,
        let sender = json["sender"] as? String,
        let recipient = json["recipient"] as? String,
        let amount = json["amount"] as? Int else {
            return
    }
    response.headers["Content-Type"] = "application/json; charset=UTF-8"
    let index = blockChainApi.createTransaction(sender: sender, recipient: recipient, amount: amount)
    response.send(
        TransactionResponse(
            message: "Transaction will be added to Block \(index)"
        )
    )
    next()
}

router.get("/mine") { request, response, next in
    response.headers["Content-Type"] = "application/json; charset=UTF-8"
    let minedBlock = blockChainApi.mine()
    response.send(
        MineResponse(
            message: "New Block Forged",
            block: minedBlock
        )
    )
    
    next()
}

router.get("/chain") { request, response, next in
    response.headers["Content-Type"] = "application/json; charset=UTF-8"
    response.send(
        ChainResponse(chain: blockChainApi.fullChain(), length: blockChainApi.fullChain().count)
    )
    next()
}

router.get("/") { request, response, next in
    response.send("hello world")
    next()
}
Kitura.addHTTPServer(onPort: Int(ProcessInfo.processInfo.environment["PORT", default: "8090"])!, with: router)

Kitura.run()
