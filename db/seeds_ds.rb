def load_schemas
@schemas = {
"140530" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CB", "industry" => "C", "sector" => "BZ"
},
"160129" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CD", "industry" => "C", "sector" => "CB"
},
"161230" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI",
  "chowder_rule" => "CF", "industry" => "C", "sector" => "CD"
},
"171229" => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "na" => "AF", "mktcap" => "AG", "inside_own" => "AH",
  "debt_equity" => "AI", "chowder_rule" => "CH", "industry" => "C", "sector" => "CF"
},
'180531' => {
"ccc_seq" => "E", "price" => "H", "yield_years" => "D", "div_yield" => "I",
  "old_rate" => "J", "new_rate" => "K", "mr_inc" => "L", "ex_div" => "M",
  "div_record" => "N", "div_pay" => "O", "qtly_sched" => "P", "annual_div" => "R",
  "payout" => "S", "i_graham" => "T", "p_e" => "U", "fye_month" => "V",
  "ttm_eps" => "W", "peg_ratio" => "X", "ttm_p_sales" => "Y", "mrq_p_book" => "Z",
  "ttm_roe" => "AA", "ty_growth" => "AB", "ny_growth" => "AC", "last_5_growth" => "AD",
  "est_5_growth" => "AE", "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI",
  "chowder_rule" => "CH", "industry" => "C", "sector" => "CF"
},
"180629" => {
"ccc_seq" => "F", "price" => "I", "yield_years" => "E", "div_yield" => "J",
  "old_rate" => "K", "new_rate" => "L", "mr_inc" => "M", "ex_div" => "N",
  "div_pay" => "O", "qtly_sched" => "Q", "payout" => "T", "annual_div" => "S",
  "i_graham" => "U", "p_e" => "V", "fye_month" => "W", "ttm_eps" => "X",
  "peg_ratio" => "Y", "ttm_p_sales" => "Z", "mrq_p_book" => "AA", "ttm_roe" => "AB",
  "ty_growth" => "AC", "ny_growth" => "AD", "last_5_growth" => "AE", "est_5_growth" => "AF",
  "mktcap" => "AG", "inside_own" => "AH", "debt_equity" => "AI", "chowder_rule" => "AQ",
  "industry" => "D", "sector" =>"C" 
},
"180731" => {
  "industry" => "D", "sector" =>"C", "ccc_seq" => "F", "price" => "I", "yield_years" => "E", "div_yield" => "J",
  "old_rate" => "O", "new_rate" => "K", "mr_inc" => "R", "ex_div" => "P",
  "div_pay" => "Q", "qtly_sched" => "N", "payout" => "Z", "annual_div" => "M",
  "i_graham" => "AQ", "p_e" => "AA", "fye_month" => "AB", "ttm_eps" => "AC",
  "peg_ratio" => "AD", "ttm_p_sales" => "AE", "mrq_p_book" => "AF", "ttm_roe" => "AG",
  "ty_growth" => "AH", "ny_growth" => "AI", "last_5_growth" => "AJ", "est_5_growth" => "AK",
  "mktcap" => "AL", "inside_own" => "AM", "debt_equity" => "AN", "chowder_rule" => "AP"
}
}
@keys = {
"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7,
"H" => 8, "I" => 9, "J" =>10, "K" => 11, "L" => 12, "M" => 13, "N" => 14,
"O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, "U" => 21,
"V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26, "AA" => 27, "AB" => 28,
"AC" => 29, "AD" => 30, "AE" => 31, "AF" => 32, "AG" => 33, "AH" => 34, "AI" => 35,
"AJ" => 36, "AK" => 37, "AL" => 38, "AM" => 39, "AN" => 40, "AO" => 41, "AP" => 42,
"AQ" => 43, "BU" => 73, "BV" => 74, "BW" => 75, "BX" => 76, "BY" => 77,"BZ" => 78,
"CB" => 80, "CC" => 81, "CD" => 82, "CE" => 83, "CF" => 84, "CG" => 85, "CH" => 86 }

@spreadsheet_names_full = [
"130131", "130228", "130329", "130430", "130531",
"130628", "130731", "130830", "130930", "131031",
"131129", "131231", 
"140131", "140228", "140331", "140430", "140530",
"140630", "140731", "140829", "140930", "141031",
"141128", "141231", 
"150130", "150227", "150331", "150430", "150529",
"150630", "150731", "150831", "150930", "151030",
"151130", "151231", 
"160129", "160229", "160331", "160429", "160531",
"160630", "160729", "160831", "160930", "161031",
"161130", "161230", 
"170131", "170228", "170331", "170428", "170531",
"170630", "170731", "170831", "170929", "171031",
"171130", "171229", 
"180131", "180228", "180329",
"180430", "180531", "180629"]

@spreadsheet_names = [
"150130", "150227", "150331", "150430", "150529",
"150630", "150731", "150831", "150930", "151030",
"151130", "151231", 

"160129", "160229", "160331", "160429", "160531",
"160630", "160729", "160831", "160930", "161031",
"161130", "161230", 

"170131", "170228", "170331", "170428", "170531",
"170630", "170731", "170831", "170929", "171031",
"171130", "171229", 

"180131", "180228", "180329",
"180430", "180531", "180629",
"180731", "180831", "180928",
"181031", "181130", "181231",

"190131", "190228", "190329", "190430",
"190531", "190628", "190731", "190831",
"190930"
]

@month_years = {
"150130"=>'140530', "150227"=>'140530', "150331"=>'140530', "150430"=>'140530', "150529"=>'140530',
"150630"=>'140530', "150731"=>'140530', "150831"=>'140530', "150930"=>'140530', "151030"=>'140530',
"151130"=>'140530',

"151231"=>'160129', 
"160129"=>'160129', "160229"=>'160129', "160331"=>'160129', "160429"=>'160129', "160531"=>'160129',
"160630"=>'160129', "160729"=>'160129', "160831"=>'160129', "160930"=>'160129', "161031"=>'160129',
"161130"=>'160129',

"161230"=>'161230', 
"170131"=>'161230', "170228"=>'161230', "170331"=>'161230', "170428"=>'161230', "170531"=>'161230',
"170630"=>'161230', "170731"=>'161230', "170831"=>'161230', "170929"=>'161230', "171031"=>'161230',
'171130'=>'161230',

'171229'=>'171229','180131'=>'171229','180228'=>'171229','180329'=>'171229','180430'=>'171229',

'180531'=>'180531',

'180629'=>'180629',

'180731'=>'180731', '180831'=>'180731', '180928'=>'180731',
'181031'=>'180731', '181130'=>'180731', '181231'=>'180731',
'190131'=>'180731', '190228'=>'180731', '190329'=>'180731', '190430'=>'180731',
'190531'=>'180731', '190628'=>'180731', '190731'=>'180731', '190831'=>'180731',
'190930'=>'180731'
}
end
