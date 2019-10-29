#!/usr/bin/env ruby
#
require 'csv'
require 'spreadsheet'
require 'rspreadsheet'


@schemas = {}
@keys = {}
@spreadsheet_names_full = []
@spreadsheet_names = []
@month_years = {}

  require_relative 'seeds_ds'
  load_schemas


def row_col_val(val)
  if val.kind_of?(Spreadsheet::Formula)
    return val.value
  end
  return val
end

@spreadsheet_names.each do |year_month|
  puts "#{year_month} is missing a month_year mapping" if @month_years[year_month].nil?
  puts "#{year_month}: missing file" unless File.exist?(['db','seeds', "#{year_month}.ods"].join("/"))
end

@spreadsheet_names.each do |year_month|
#["190628c"].each do |year_month|

puts "#{year_month}\n"

book = Rspreadsheet.open(['db', 'seeds', "#{year_month}.ods"].join("/"))

sheet = book.worksheet 'All CCC'

date_row = sheet.row(5)
date = "20#{year_month}"
schema = @schemas[@month_years[year_month]]
@debug_flag = false

row4 = sheet.row[4]
row = sheet.row[5]

  schema.each do |key, alphac|
    col = @keys[alphac]
    puts "#{key}=#{row_col_val(row4[col])}/#{row_col_val(row[col])}"
  end
end

