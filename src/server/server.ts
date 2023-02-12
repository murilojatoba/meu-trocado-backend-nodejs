import * as restify from 'restify'
import { environment } from '../conf/environment'

export class Server {

    serverOptions: restify.ServerOptions = { name: environment.SERVER.NAME, version: environment.SERVER.VERSION }
    server = restify.createServer(this.serverOptions)

    bootstrap(): void {

        this.server.get('/', (req, resp, next) => {
            resp.json(this.serverOptions)
            return next()
        })

        this.server.listen(environment.SERVER.PORT, () => {
            console.log(`API is running at port ${environment.SERVER.PORT}...`)
        })
    }
}