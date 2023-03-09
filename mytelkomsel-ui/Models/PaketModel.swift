//
//  PaketModel.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 08/03/23.
//

import Foundation

struct PaketStruct{
    var nama: String
    var jumlah: String
    var hargaAwal: String
    var hargaDiskon: String
    var masaAktif: String
    var isPopular: Bool
    var isLanggananKamu: Bool
    var isBelajar: Bool
    var rincian: [RincianPaketStruct]
}

struct RincianPaketStruct{
    var jenis: String
    var jumlah: String
}

struct VoucherStruct{
    var thumbnailImage: String
    var label: String
}

public struct PaketProvider{
    static func paket() -> [PaketStruct]{
        return [
            PaketStruct(nama: "Internet OMG!", jumlah: "190 GB", hargaAwal: "Rp300.000", hargaDiskon: "Rp200.000", masaAktif: "30 HARI", isPopular: true, isLanggananKamu: true, isBelajar: false, rincian: [
                RincianPaketStruct(jenis: "Internet Lokal", jumlah: "100 GB"),
                RincianPaketStruct(jenis: "OMG", jumlah: "90 GB"),
                RincianPaketStruct(jenis: "Video Prime", jumlah: "30 hari"),
                RincianPaketStruct(jenis: "SMS", jumlah: "100 SMS")
            ]),
            PaketStruct(nama: "Ketengan", jumlah: "20 GB", hargaAwal: "Rp30.000", hargaDiskon: "Rp20.000", masaAktif: "30 HARI", isPopular: true, isLanggananKamu: true, isBelajar: false, rincian: [
                RincianPaketStruct(jenis: "Internet Lokal", jumlah: "20 GB")
            ]),
            PaketStruct(nama: "HOT PROMO", jumlah: "30 GB", hargaAwal: "", hargaDiskon: "Rp20.000", masaAktif: "7 HARI", isPopular: true, isLanggananKamu: false, isBelajar: false, rincian: [
                RincianPaketStruct(jenis: "OMG", jumlah: "30 GB"),
                RincianPaketStruct(jenis: "Video Prime", jumlah: "30 hari"),
                RincianPaketStruct(jenis: "SMS", jumlah: "10 SMS")
            ]),
            PaketStruct(nama: "RuangGuru", jumlah: "3 GB", hargaAwal: "", hargaDiskon: "", masaAktif: "7 HARI", isPopular: false, isLanggananKamu: false, isBelajar: true, rincian: [
                RincianPaketStruct(jenis: "Ruang Guru", jumlah: "3 GB")
            ])
        ]
    }
    static func voucher() -> [VoucherStruct]{
        return [
            VoucherStruct(thumbnailImage: "voucher1", label: "Double Benefits from DOUBLE UNTUNG whayahe wayahe"),
            VoucherStruct(thumbnailImage: "voucher2", label: "Insert judul yang menarik disini brrooo")
        ]
    }
}
