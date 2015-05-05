# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150505151525) do

  create_table "baidang", primary_key: "ID_BAIDANG", force: :cascade do |t|
    t.integer "ID_TAIKHOAN", limit: 4
    t.integer "ID_DANHMUC",  limit: 4
    t.integer "ID_LOAIDANG", limit: 4
    t.text    "TIEUDE",      limit: 65535
    t.text    "TOMTAT",      limit: 65535
    t.text    "NOIDUNG",     limit: 65535
    t.text    "HINHANH",     limit: 65535
    t.date    "NGAYTAO"
    t.date    "NGAYCAPNHAT"
    t.text    "CAPNHATBOI",  limit: 65535
    t.text    "URL",         limit: 65535
  end

  add_index "baidang", ["ID_DANHMUC"], name: "ID_DANHMUC", using: :btree
  add_index "baidang", ["ID_LOAIDANG"], name: "ID_LOAIDANG", using: :btree
  add_index "baidang", ["ID_TAIKHOAN"], name: "ID_TAIKHOAN", using: :btree

  create_table "binhluan", id: false, force: :cascade do |t|
    t.integer "ID_BAIDANG",     limit: 4
    t.integer "ID_TAIKHOAN",    limit: 4
    t.text    "HOTENNGUOIBINH", limit: 65535
    t.text    "EMAILNGUOIBINH", limit: 65535
    t.text    "NOIDUNG",        limit: 65535
    t.date    "NGAYTAO"
    t.date    "NGAYCAPNHAT"
  end

  add_index "binhluan", ["ID_BAIDANG"], name: "FK_BINHLUAN_BAIDANG", using: :btree
  add_index "binhluan", ["ID_TAIKHOAN"], name: "FK_BINH_LUAN_BOI", using: :btree

  create_table "counter2s", force: :cascade do |t|
    t.string   "productId",  limit: 255
    t.string   "shopName",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "danhmuc", primary_key: "ID_DANHMUC", force: :cascade do |t|
    t.text "TENDANHMUC", limit: 65535
    t.text "MOTANGAN",   limit: 65535
    t.text "URL",        limit: 65535
  end

  create_table "duongdi", primary_key: "ID_DUONGDI", force: :cascade do |t|
    t.integer "ID_DIADIEM", limit: 4
    t.text    "DIEMDEN",    limit: 65535
    t.text    "CHIEUDAI",   limit: 65535
    t.text    "THOIGIAN",   limit: 65535
  end

  add_index "duongdi", ["ID_DIADIEM"], name: "FK_DIADIEM_DIADIEM", using: :btree

  create_table "hinhanh", primary_key: "ID_HINHANH", force: :cascade do |t|
    t.text "TENHINHANH", limit: 65535
    t.text "MOTA",       limit: 65535
    t.text "URL",        limit: 65535
  end

  create_table "hinhanhdiadiem", id: false, force: :cascade do |t|
    t.integer "ID_HINHANH", limit: 4, null: false
    t.integer "ID_DIADIEM", limit: 4, null: false
  end

  add_index "hinhanhdiadiem", ["ID_DIADIEM"], name: "ID_DIADIEM", using: :btree

  create_table "kehoach", primary_key: "ID_KEHOACH", force: :cascade do |t|
    t.integer "ID_LOAIKH",    limit: 4
    t.text    "TENLOAIKH",    limit: 65535
    t.date    "NGAYXUATPHAT"
    t.date    "NGAYVE"
    t.decimal "SOTIEN",                     precision: 8
    t.decimal "SONGUOI",                    precision: 8
    t.date    "NGAYTAO"
    t.date    "NGAYCAPNHAT"
    t.boolean "TRANGTHAI",    limit: 1
  end

  add_index "kehoach", ["ID_LOAIKH"], name: "FK_LOAIHINHKEHOACH", using: :btree

  create_table "lichtrinh", id: false, force: :cascade do |t|
    t.integer "ID_KEHOACH",   limit: 4,               null: false
    t.integer "ID_DIADIEM",   limit: 4,               null: false
    t.integer "SOTHUTU",      limit: 4
    t.decimal "THOIGIANTHAM",           precision: 8
    t.decimal "CHIPHI",                 precision: 8
  end

  add_index "lichtrinh", ["ID_DIADIEM"], name: "FK_LICHTRINH2", using: :btree

  create_table "loaibaidang", primary_key: "ID_LOAIDANG", force: :cascade do |t|
    t.text "TENLOAI", limit: 65535
    t.text "MOTA",    limit: 65535
  end

  create_table "loaidiadiem", primary_key: "ID_LOAIDIADIEM", force: :cascade do |t|
    t.text "TENLOAIDIADIEM", limit: 65535
    t.text "MOTANGAN",       limit: 65535
    t.text "LINK",           limit: 65535
  end

  create_table "loaikehoach", primary_key: "ID_LOAIKH", force: :cascade do |t|
    t.text "TENLOAIKH", limit: 65535
    t.text "MOTA",      limit: 65535
  end

  create_table "loaitaikhoan", primary_key: "ID_LOAITK", force: :cascade do |t|
    t.text "TENTK", limit: 65535
    t.text "MOTA",  limit: 65535
  end

  create_table "quanhuyen", primary_key: "ID_QUANHUYEN", force: :cascade do |t|
    t.integer "ID_TINHTP",    limit: 4
    t.text    "TENQUANHUYEN", limit: 65535
    t.text    "MOTA",         limit: 65535
  end

  add_index "quanhuyen", ["ID_TINHTP"], name: "FK_TINHTP_CUA_HUYEN", using: :btree

  create_table "record", force: :cascade do |t|
    t.text    "name",    limit: 65535, null: false
    t.integer "current", limit: 4,     null: false
    t.integer "max",     limit: 4,     null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", limit: 255, null: false
    t.string   "shopify_token",  limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

  create_table "sohuukehoach", id: false, force: :cascade do |t|
    t.integer "ID_KEHOACH",  limit: 4, null: false
    t.integer "ID_TAIKHOAN", limit: 4, null: false
    t.boolean "TAOKEHOACH",  limit: 1
  end

  add_index "sohuukehoach", ["ID_TAIKHOAN"], name: "FK_SOHUUKEHOACH2", using: :btree

  create_table "taikhoan", primary_key: "ID_TAIKHOAN", force: :cascade do |t|
    t.integer "ID_LOAITK",    limit: 4
    t.text    "TENTAIKHOAN",  limit: 65535
    t.text    "MATKHAU",      limit: 65535
    t.text    "TENHIENTHI",   limit: 65535
    t.text    "HINHDAIDIEN",  limit: 65535
    t.text    "DIACHI",       limit: 65535
    t.text    "EMAIL",        limit: 65535
    t.text    "SODIENTHOAI",  limit: 65535
    t.boolean "TRANGTHAI",    limit: 1
    t.date    "NGAYTAO"
    t.date    "NGAYKICHHOAT"
    t.date    "NGAYDANGNHAP"
    t.date    "NGAYCAPNHAT"
    t.text    "URL",          limit: 65535
  end

  add_index "taikhoan", ["ID_LOAITK"], name: "FK_LOAIHINH_TAIKHOAN", using: :btree

  create_table "thongtindiadiem", primary_key: "ID_DIADIEM", force: :cascade do |t|
    t.integer "ID_BAIDANG",     limit: 4
    t.integer "ID_QUANHUYEN",   limit: 4
    t.integer "ID_LOAIDIADIEM", limit: 4
    t.text    "TENDIADIEM",     limit: 65535
    t.text    "GIOMOCUA",       limit: 65535
    t.text    "GIODONGCUA",     limit: 65535
    t.text    "GIATHAP",        limit: 65535
    t.text    "GIACAO",         limit: 65535
    t.decimal "THOIGIANTHAM",                 precision: 8
    t.text    "MOTADIADIEM",    limit: 65535
    t.text    "DIACHI",         limit: 65535
    t.text    "SODIENTHOAI",    limit: 65535
    t.decimal "KINHDO",                       precision: 8
    t.decimal "VIDO",                         precision: 8
    t.decimal "LUOTXEM",                      precision: 8
    t.decimal "DIEMTRUNGBINH",                precision: 8
    t.text    "KICHHOAT",       limit: 65535
    t.date    "NGAYTAO"
    t.date    "NGAYCAPNHAT"
  end

  add_index "thongtindiadiem", ["ID_BAIDANG"], name: "ID_BAIDANG", using: :btree
  add_index "thongtindiadiem", ["ID_LOAIDIADIEM"], name: "ID_LOAIDIADIEM", using: :btree
  add_index "thongtindiadiem", ["ID_QUANHUYEN"], name: "ID_QUANHUYEN", using: :btree

  create_table "tinhthanhpho", primary_key: "ID_TINHTP", force: :cascade do |t|
    t.text "TENTINHTP", limit: 65535
    t.text "MOTA",      limit: 65535
  end

  add_foreign_key "baidang", "danhmuc", column: "ID_DANHMUC", primary_key: "ID_DANHMUC", name: "baidang_ibfk_2", on_update: :cascade
  add_foreign_key "baidang", "loaibaidang", column: "ID_LOAIDANG", primary_key: "ID_LOAIDANG", name: "baidang_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baidang", "taikhoan", column: "ID_TAIKHOAN", primary_key: "ID_TAIKHOAN", name: "baidang_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "binhluan", "baidang", column: "ID_BAIDANG", primary_key: "ID_BAIDANG", name: "FK_BINHLUAN_BAIDANG"
  add_foreign_key "binhluan", "taikhoan", column: "ID_TAIKHOAN", primary_key: "ID_TAIKHOAN", name: "FK_BINH_LUAN_BOI"
  add_foreign_key "duongdi", "thongtindiadiem", column: "ID_DIADIEM", primary_key: "ID_DIADIEM", name: "FK_DIADIEM_DIADIEM"
  add_foreign_key "hinhanhdiadiem", "hinhanh", column: "ID_HINHANH", primary_key: "ID_HINHANH", name: "hinhanhdiadiem_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hinhanhdiadiem", "thongtindiadiem", column: "ID_DIADIEM", primary_key: "ID_DIADIEM", name: "hinhanhdiadiem_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kehoach", "loaikehoach", column: "ID_LOAIKH", primary_key: "ID_LOAIKH", name: "FK_LOAIHINHKEHOACH"
  add_foreign_key "lichtrinh", "kehoach", column: "ID_KEHOACH", primary_key: "ID_KEHOACH", name: "FK_LICHTRINH"
  add_foreign_key "lichtrinh", "thongtindiadiem", column: "ID_DIADIEM", primary_key: "ID_DIADIEM", name: "FK_LICHTRINH2"
  add_foreign_key "quanhuyen", "tinhthanhpho", column: "ID_TINHTP", primary_key: "ID_TINHTP", name: "FK_TINHTP_CUA_HUYEN"
  add_foreign_key "sohuukehoach", "kehoach", column: "ID_KEHOACH", primary_key: "ID_KEHOACH", name: "FK_SOHUUKEHOACH"
  add_foreign_key "sohuukehoach", "taikhoan", column: "ID_TAIKHOAN", primary_key: "ID_TAIKHOAN", name: "FK_SOHUUKEHOACH2"
  add_foreign_key "taikhoan", "loaitaikhoan", column: "ID_LOAITK", primary_key: "ID_LOAITK", name: "FK_LOAIHINH_TAIKHOAN"
  add_foreign_key "thongtindiadiem", "baidang", column: "ID_BAIDANG", primary_key: "ID_BAIDANG", name: "thongtindiadiem_ibfk_4", on_update: :cascade, on_delete: :nullify
  add_foreign_key "thongtindiadiem", "loaidiadiem", column: "ID_LOAIDIADIEM", primary_key: "ID_LOAIDIADIEM", name: "thongtindiadiem_ibfk_6", on_update: :cascade, on_delete: :nullify
  add_foreign_key "thongtindiadiem", "quanhuyen", column: "ID_QUANHUYEN", primary_key: "ID_QUANHUYEN", name: "thongtindiadiem_ibfk_5", on_update: :cascade, on_delete: :nullify
end
