//
//  Login.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
import Alamofire

struct LoginDetails: Codable {
    let status: Int?
    let data: DataClass?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken: String?
    let profile: Profile?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case profile = "profile"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let email: String?
    let phone: String?
    let name: String?
    let company: String?
    let designation: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case phone = "phone"
        case name = "name"
        case company = "company"
        case designation = "designation"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseLoginDetails(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LoginDetails>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

