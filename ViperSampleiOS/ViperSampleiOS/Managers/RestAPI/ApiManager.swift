import Foundation
import PromiseKit
import Alamofire

class ApiManager {

    static func get<T: Codable>(
        url: String,
        parameters: [String: Any] = [:],
        headers: [String: String] = [:]
    ) -> Promise<BaseResponse<T>> {
        return networkCall(url: url, method: .get, parameters: parameters, headers: headers)
    }

    private static func networkCall<T: Codable>(
            url: String,
            method: HTTPMethod,
            parameters: [String: Any]? = nil,
            encoding: ParameterEncoding = URLEncoding(destination: .queryString),
            headers: [String: String]
        ) -> Promise<BaseResponse<T>> {

            let httpHeaders = HTTPHeaders(headers)

            return Promise { seal in
                let request = AF.request(
                    url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: httpHeaders, requestModifier: { request in
                        request.timeoutInterval = 300
                    }
                ).validate().responseDecodable(of: BaseResponse<T>.self) { response in
                    switch response.result {
                        case .success(let response):
                            seal.fulfill(response)
                        case .failure(let error):
                            seal.reject(error)
                    }
                }
            }
        }

}
