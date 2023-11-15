//
//  Rocket+Stubs.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import SharedDomain

public extension Rocket {
    static let stub: Rocket = createMock(id: "5e9d0d95eda69955f709d1eb")
    
    static func createMock(id: String) -> Rocket {
        Rocket(
            id: id,
            name: "Falcon 1",
            description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
            wikipedia: "https://en.wikipedia.org/wiki/Falcon_1",
            active: false,
            stages: 2,
            boosters: 0,
            costPerLaunch: 6700000,
            successRatePct: 40,
            firstFlight: "2006-03-24",
            country: "Republic of the Marshall Islands",
            company: "SpaceX",
            flickrImages: [
                "https://imgur.com/DaCfMsj.jpg",
                "https://imgur.com/azYafd8.jpg"
            ],
            firstStage: RocketFirstStage(
                reusable: false,
                engines: 1,
                fuelAmountTons: 44.3,
                burnTimeSec: 169
            ),
            secondStage: RocketSecondStage(
                reusable: false,
                engines: 1,
                fuelAmountTons: 3.38,
                burnTimeSec: 378
            ),
            height: RocketHeight(meters: 22.25, feet: 73),
            diameter: RocketDiameter(meters: 1.68, feet: 5.5),
            mass: RocketMass(kg: 30146, lb: 66460)
        )
    }
}

public extension Array where Element == Rocket {
    static let stub = [
        Rocket.createMock(id: "5e9d0d95eda69955f709d1eb"),
        Rocket.createMock(id: "5e9d0d95eda69973a809d1ec")
    ]
}
