//
//  URLRequest+Extension.swift
//  RXCocoaProject
//
//  Created by Mohamed osama on 13/08/2021.
//

import Foundation
import RxSwift
import RxCocoa


struct Resource<T>{
    let url: URL
}

extension URLRequest{
    
    static func load<T: Codable>(resource: Resource<T>) -> Observable<T>{
        return Observable.from([resource.url]).flatMap{ url -> Observable<Data> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.data(request: request)
        }.map { data in
            return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
