//
//  MarketData.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/28/22.
//

import Foundation

/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13275,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 603,
     "total_market_cap": {
       "btc": 50535433.67969018,
       "eth": 674402929.4777377,
       "ltc": 18882309498.96831,
       "bch": 9112604687.362627,
       "bnb": 3535353264.9659657,
       "eos": 907871111511.5349,
       "xrp": 2227173548843.165,
       "xlm": 9265928271005.172,
       "link": 147399786376.78156,
       "dot": 160518101126.35925,
       "yfi": 127939486.87165174,
       "usd": 1032963364575.5022,
       "aed": 3794074438085.8267,
       "ars": 161156121418047.1,
       "aud": 1610942520773.2612,
       "bdt": 104724762615510.05,
       "bhd": 389400331397.4864,
       "bmd": 1032963364575.5022,
       "brl": 5509723290309.282,
       "cad": 1404509957179.666,
       "chf": 1029227136085.8325,
       "clp": 960552632718762.9,
       "cny": 7492289875939.047,
       "czk": 25401188912930.406,
       "dkk": 7720078957095.218,
       "eur": 1037165459542.5961,
       "gbp": 892958609031.0333,
       "hkd": 8108235600601.775,
       "huf": 427672313041572.75,
       "idr": 16077052464369168,
       "ils": 3656360795283.9873,
       "inr": 85111116621645.02,
       "jpy": 152395925825076.84,
       "krw": 1472055788994582,
       "kwd": 319900490302.117,
       "lkr": 379326599963817.8,
       "mmk": 2170534878466365.8,
       "mxn": 20471020047949.832,
       "myr": 4878169489207.82,
       "ngn": 452437953684070.8,
       "nok": 10683753113435.457,
       "nzd": 1777803290833.3303,
       "php": 59889144786541.55,
       "pkr": 229197864482809.3,
       "pln": 4895962283162.635,
       "rub": 63553072038471.21,
       "sar": 3882235795325.62,
       "sek": 11328852163136.607,
       "sgd": 1457912097201.4917,
       "thb": 39211284154469.31,
       "try": 19219006472282.49,
       "twd": 33189371144652.086,
       "uah": 38238538422195.1,
       "vef": 103430621694.94502,
       "vnd": 25650946595123856,
       "zar": 18700957784570.65,
       "xdr": 768171469773.489,
       "xag": 53660566796.37398,
       "xau": 629054029.7591921,
       "bits": 50535433679690.18,
       "sats": 5053543367969018
     },
     "total_volume": {
       "btc": 4083302.9557110434,
       "eth": 54492289.36534012,
       "ltc": 1525705521.327599,
       "bch": 736305656.1457464,
       "bnb": 285659336.13665426,
       "eos": 73356702873.80124,
       "xrp": 179957381834.59286,
       "xlm": 748694322803.6011,
       "link": 11910019159.989494,
       "dot": 12969989352.991446,
       "yfi": 10337611.589650309,
       "usd": 83464255722.9605,
       "aed": 306564211270.4345,
       "ars": 13021541896487.268,
       "aud": 130165428048.90764,
       "bdt": 8461843534072.768,
       "bhd": 31463854336.9074,
       "bmd": 83464255722.9605,
       "brl": 445189993600.6999,
       "cad": 113485513863.95229,
       "chf": 83162365510.01056,
       "clp": 77613411396781.25,
       "cny": 605382939609.7782,
       "czk": 2052436126781.0376,
       "dkk": 623788477281.804,
       "eur": 83803788315.24156,
       "gbp": 72151760895.03769,
       "hkd": 655151840654.8225,
       "huf": 34556260682101.637,
       "idr": 1299038537256352.5,
       "ils": 295436840161.7053,
       "inr": 6877045446326.147,
       "jpy": 12313711173511.635,
       "krw": 118943270424309.14,
       "kwd": 25848212283.355133,
       "lkr": 30649888880533.574,
       "mmk": 175380932533237.1,
       "mxn": 1654074588496.26,
       "myr": 394159947651.6819,
       "ngn": 36557344006656.77,
       "nok": 863255689912.2968,
       "nzd": 143647910061.37186,
       "php": 4839090200984.518,
       "pkr": 18519368477517.18,
       "pln": 395597619456.51,
       "rub": 5135138416819.407,
       "sar": 313687718567.87805,
       "sek": 915380202646.6107,
       "sgd": 117800448956.31801,
       "thb": 3168302729922.308,
       "try": 1552910902704.6917,
       "twd": 2681727402442.6562,
       "uah": 3089704106450.9727,
       "vef": 8357275925.540034,
       "vnd": 2072616744768331.5,
       "zar": 1511052159567.2776,
       "xdr": 62068861482.425385,
       "xag": 4335816179.862395,
       "xau": 50828062.450168714,
       "bits": 4083302955711.0435,
       "sats": 408330295571104.4
     },
     "market_cap_percentage": {
       "btc": 37.976795334558005,
       "eth": 17.871442416641084,
       "usdt": 6.661041296232378,
       "bnb": 4.618409388368926,
       "usdc": 4.245178369869448,
       "xrp": 2.248810651004628,
       "busd": 2.0544801585767867,
       "ada": 1.324871181454013,
       "doge": 1.1117828005999562,
       "sol": 1.0748562035575435
     },
     "market_cap_change_percentage_24h_usd": -0.8562405294852388,
     "updated_at": 1666967698
   }
 }
 */
