struct ErrorChain: Error {
    let msg: String
    let cause: Error?

    init(msg: String, cause: Error? = nil) {
        self.msg = msg
        self.cause = cause
    }
}

extension Error {
    func chain(_ msg: String) -> ErrorChain {
        ErrorChain(msg: msg, cause: self)
    }
}
