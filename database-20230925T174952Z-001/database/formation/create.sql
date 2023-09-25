CREATE SCHEMA cic_retail_bidw_stage;

CREATE SCHEMA cic_retail_bidw_data;

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_prod (
    sku_id VARCHAR(24) NOT NULL,
    sku_label VARCHAR(120) NOT NULL,
    stylclr_id VARCHAR(24) NOT NULL,
    stylclr_label VARCHAR(120) NOT NULL,
    styl_id VARCHAR(24) NOT NULL,
    styl_label VARCHAR(120) NOT NULL,
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    issvc BOOLEAN NOT NULL,
    isasmbly BOOLEAN NOT NULL,
    isnfs BOOLEAN NOT NULL,
    PRIMARY KEY (sku_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_sku (
    sku_id VARCHAR(24) NOT NULL,
    sku_label VARCHAR(120) NOT NULL,
    stylclr_id VARCHAR(24) NOT NULL,
    stylclr_label VARCHAR(120) NOT NULL,
    styl_id VARCHAR(24) NOT NULL,
    styl_label VARCHAR(120) NOT NULL,
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    issvc BOOLEAN NOT NULL,
    isasmbly BOOLEAN NOT NULL,
    isnfs BOOLEAN NOT NULL,
    PRIMARY KEY (sku_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_stylclr (
    stylclr_id VARCHAR(24) NOT NULL,
    stylclr_label VARCHAR(120) NOT NULL,
    styl_id VARCHAR(24) NOT NULL,
    styl_label VARCHAR(120) NOT NULL,
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (stylclr_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_styl (
    styl_id VARCHAR(24) NOT NULL,
    styl_label VARCHAR(120) NOT NULL,
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (styl_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_subcat (
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (subcat_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_cat (
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (cat_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_prod_dept (
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (dept_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_invloc (
    loc_id VARCHAR(24) NOT NULL,
    loc_label VARCHAR(120) NOT NULL,
    loctype_id VARCHAR(5) NOT NULL,
    loctype_label VARCHAR(5) NOT NULL,
    PRIMARY KEY (loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_invloc_loc (
    loc_id VARCHAR(24) NOT NULL,
    loc_label VARCHAR(120) NOT NULL,
    loctype_id VARCHAR(5) NOT NULL,
    loctype_label VARCHAR(5) NOT NULL,
    PRIMARY KEY (loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_invloc_loctype (
    loctype_id VARCHAR(5) NOT NULL,
    loctype_label VARCHAR(5) NOT NULL,
    PRIMARY KEY (loctype_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_possite (
    site_id VARCHAR(24) NOT NULL,
    site_label VARCHAR(120) NOT NULL,
    subchnl_id VARCHAR(24) NOT NULL,
    subchnl_label VARCHAR(120) NOT NULL,
    chnl_id VARCHAR(24) NOT NULL,
    chnl_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (site_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_possite_site (
    site_id VARCHAR(24) NOT NULL,
    site_label VARCHAR(120) NOT NULL,
    subchnl_id VARCHAR(24) NOT NULL,
    subchnl_label VARCHAR(120) NOT NULL,
    chnl_id VARCHAR(24) NOT NULL,
    chnl_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (site_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_possite_subchnl (
    subchnl_id VARCHAR(24) NOT NULL,
    subchnl_label VARCHAR(120) NOT NULL,
    chnl_id VARCHAR(24) NOT NULL,
    chnl_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (subchnl_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_possite_chnl (
    chnl_id VARCHAR(24) NOT NULL,
    chnl_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (chnl_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_rtlloc (
    str_id VARCHAR(24) NOT NULL,
    str_label VARCHAR(120) NOT NULL,
    dstr_id VARCHAR(24) NOT NULL,
    dstr_label VARCHAR(120) NOT NULL,
    rgn_id VARCHAR(24) NOT NULL,
    rgn_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (str_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_rtlloc_str (
    str_id VARCHAR(24) NOT NULL,
    str_label VARCHAR(120) NOT NULL,
    dstr_id VARCHAR(24) NOT NULL,
    dstr_label VARCHAR(120) NOT NULL,
    rgn_id VARCHAR(24) NOT NULL,
    rgn_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (str_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_rtlloc_dstr (
    dstr_id VARCHAR(24) NOT NULL,
    dstr_label VARCHAR(120) NOT NULL,
    rgn_id VARCHAR(24) NOT NULL,
    rgn_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (dstr_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_rtlloc_rgn (
    rgn_id VARCHAR(24) NOT NULL,
    rgn_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (rgn_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_clnd (
    fscldt_id VARCHAR(8) NOT NULL,
    fscldt_label VARCHAR(12) NOT NULL,
    fsclwk_id VARCHAR(6) NOT NULL,
    fsclwk_label VARCHAR(11) NOT NULL,
    fsclmth_id VARCHAR(6) NOT NULL,
    fsclmth_label VARCHAR(9) NOT NULL,
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    ssn_id VARCHAR(24) NOT NULL,
    ssn_label VARCHAR(120) NOT NULL,
    ly_fscldt_id VARCHAR(8) NOT NULL,
    lly_fscldt_id VARCHAR(8) NOT NULL,
    fscldow INTEGER NOT NULL,
    fscldom INTEGER NOT NULL,
    fscldoq INTEGER NOT NULL,
    fscldoy INTEGER NOT NULL,
    fsclwoy INTEGER NOT NULL,
    fsclmoy INTEGER NOT NULL,
    fsclqoy INTEGER NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (fscldt_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_fscldt (
    fscldt_id VARCHAR(8) NOT NULL,
    fscldt_label VARCHAR(12) NOT NULL,
    fsclwk_id VARCHAR(6) NOT NULL,
    fsclwk_label VARCHAR(11) NOT NULL,
    fsclmth_id VARCHAR(6) NOT NULL,
    fsclmth_label VARCHAR(9) NOT NULL,
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    ssn_id VARCHAR(24) NOT NULL,
    ssn_label VARCHAR(120) NOT NULL,
    ly_fscldt_id VARCHAR(8) NOT NULL,
    lly_fscldt_id VARCHAR(8) NOT NULL,
    fscldow INTEGER NOT NULL,
    fscldom INTEGER NOT NULL,
    fscldoq INTEGER NOT NULL,
    fscldoy INTEGER NOT NULL,
    fsclwoy INTEGER NOT NULL,
    fsclmoy INTEGER NOT NULL,
    fsclqoy INTEGER NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (fscldt_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_fsclwk (
    fsclwk_id VARCHAR(6) NOT NULL,
    fsclwk_label VARCHAR(11) NOT NULL,
    fsclmth_id VARCHAR(6) NOT NULL,
    fsclmth_label VARCHAR(9) NOT NULL,
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    PRIMARY KEY (fsclwk_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_fsclmth (
    fsclmth_id VARCHAR(6) NOT NULL,
    fsclmth_label VARCHAR(9) NOT NULL,
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    PRIMARY KEY (fsclmth_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_fsclqrtr (
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    PRIMARY KEY (fsclqrtr_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_fsclyr (
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    PRIMARY KEY (fsclyr_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_clnd_ssn (
    ssn_id VARCHAR(24) NOT NULL,
    ssn_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (ssn_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_hldy (
    hldy_id VARCHAR(24) NOT NULL,
    hldy_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (hldy_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_hldy_hldy (
    hldy_id VARCHAR(24) NOT NULL,
    hldy_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (hldy_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_invstatus (
    code_id VARCHAR(24) NOT NULL,
    code_label VARCHAR(120) NOT NULL,
    bckt_id VARCHAR(24) NOT NULL,
    bckt_label VARCHAR(120) NOT NULL,
    ownrshp_id VARCHAR(24) NOT NULL,
    ownrshp_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (code_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_invstatus_code (
    code_id VARCHAR(24) NOT NULL,
    code_label VARCHAR(120) NOT NULL,
    bckt_id VARCHAR(24) NOT NULL,
    bckt_label VARCHAR(120) NOT NULL,
    ownrshp_id VARCHAR(24) NOT NULL,
    ownrshp_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (code_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_invstatus_bckt (
    bckt_id VARCHAR(24) NOT NULL,
    bckt_label VARCHAR(120) NOT NULL,
    ownrshp_id VARCHAR(24) NOT NULL,
    ownrshp_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (bckt_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_invstatus_ownrshp (
    ownrshp_id VARCHAR(24) NOT NULL,
    ownrshp_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (ownrshp_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_hier_pricestate (
    substate_id VARCHAR(24) NOT NULL,
    substate_label VARCHAR(120) NOT NULL,
    state_id VARCHAR(24) NOT NULL,
    state_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (substate_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_pricestate_substate (
    substate_id VARCHAR(24) NOT NULL,
    substate_label VARCHAR(120) NOT NULL,
    state_id VARCHAR(24) NOT NULL,
    state_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (substate_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.hier_pricestate_state (
    state_id VARCHAR(24) NOT NULL,
    state_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (state_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_transactions (
    order_id VARCHAR(24) NOT NULL,
    line_id INTEGER NOT NULL,
    type VARCHAR(24) NOT NULL,
    dt TIMESTAMP NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    fscldt_id VARCHAR(8) NOT NULL,
    price_substate_id VARCHAR(3) NOT NULL,
    sales_units DOUBLE NOT NULL,
    sales_dollars DOUBLE NOT NULL,
    discount_dollars DOUBLE ,
    original_order_id VARCHAR(24) ,
    original_line_id INTEGER ,
    PRIMARY KEY (order_id, line_id, type, dt)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_transactions (
    order_id VARCHAR(24) NOT NULL,
    line_id INTEGER NOT NULL,
    type VARCHAR(24) NOT NULL,
    dt TIMESTAMP NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    fscldt_id VARCHAR(8) NOT NULL,
    price_substate_id VARCHAR(3) NOT NULL,
    sales_units DOUBLE NOT NULL,
    sales_dollars DOUBLE NOT NULL,
    discount_dollars DOUBLE ,
    original_order_id VARCHAR(24) ,
    original_line_id INTEGER ,
    PRIMARY KEY (order_id, line_id, type, dt)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_transactions (
    fscldt_id VARCHAR(8) NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, pos_site_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_averagecosts (
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    average_unit_standardcost DOUBLE NOT NULL,
    average_unit_landedcost DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, sku_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_averagecosts (
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    average_unit_standardcost DOUBLE NOT NULL,
    average_unit_landedcost DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, sku_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_averagecosts (
    fscldt_id VARCHAR(8) NOT NULL,
    PRIMARY KEY (fscldt_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_ships (
    order_id VARCHAR(24) NOT NULL,
    line_id VARCHAR(120) NOT NULL,
    ship_type VARCHAR(3) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    dt TIMESTAMP NOT NULL,
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (order_id, line_id, ship_type, invloc_loc_id, dt)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_ships (
    order_id VARCHAR(24) NOT NULL,
    line_id VARCHAR(120) NOT NULL,
    ship_type VARCHAR(3) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    dt TIMESTAMP NOT NULL,
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (order_id, line_id, ship_type, invloc_loc_id, dt)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_ships (
    fscldt_id VARCHAR(8) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_onhandinventory (
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, sku_id, invloc_loc_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_onhandinventory (
    fscldt_id VARCHAR(8) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, sku_id, invloc_loc_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_onhandinventory (
    fscldt_id VARCHAR(8) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_intransit (
    fscldt_id VARCHAR(8) NOT NULL,
    loc_from VARCHAR(24) NOT NULL,
    loc_to VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, loc_from, loc_to, sku_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_intransit (
    fscldt_id VARCHAR(8) NOT NULL,
    loc_from VARCHAR(24) NOT NULL,
    loc_to VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, loc_from, loc_to, sku_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_intransit (
    fscldt_id VARCHAR(8) NOT NULL,
    loc_from VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, loc_from)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_onorder (
    fscldt_id VARCHAR(8) NOT NULL,
    po_id VARCHAR(24) NOT NULL,
    shipmentnumber VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    expectedinhousedate VARCHAR(8) ,
    PRIMARY KEY (fscldt_id, po_id, shipmentnumber, sku_id, invloc_loc_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_onorder (
    fscldt_id VARCHAR(8) NOT NULL,
    po_id VARCHAR(24) NOT NULL,
    shipmentnumber VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    invstatus_code VARCHAR(24) NOT NULL,
    eopquantity DOUBLE NOT NULL,
    expectedinhousedate VARCHAR(8) ,
    PRIMARY KEY (fscldt_id, po_id, shipmentnumber, sku_id, invloc_loc_id, invstatus_code)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_onorder (
    fscldt_id VARCHAR(8) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.stage_fact_receipts (
    fscldt_id VARCHAR(8) NOT NULL,
    po_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, po_id, sku_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.fact_receipts (
    fscldt_id VARCHAR(8) NOT NULL,
    po_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (fscldt_id, po_id, sku_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_stage.ovrly_fact_receipts (
    fscldt_id VARCHAR(8) NOT NULL,
    invloc_loc_id VARCHAR(24) NOT NULL,
    PRIMARY KEY (fscldt_id, invloc_loc_id)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.view_sales_byday (
    fscldt_id VARCHAR(8) NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    price_substate_id VARCHAR(3) NOT NULL,
    isdiscounted BOOLEAN NOT NULL,
    sold_sales_units DOUBLE ,
    sold_sales_dollars DOUBLE ,
    sold_discount_dollars DOUBLE ,
    cancelled_sales_units DOUBLE ,
    cancelled_sales_dollars DOUBLE ,
    cancelled_discount_dollars DOUBLE ,
    returned_sales_units DOUBLE ,
    returned_sales_dollars DOUBLE ,
    returned_discount_dollars DOUBLE ,
    ly_sold_sales_units DOUBLE ,
    ly_sold_sales_dollars DOUBLE ,
    ly_sold_discount_dollars DOUBLE ,
    ly_cancelled_sales_units DOUBLE ,
    ly_cancelled_sales_dollars DOUBLE ,
    ly_cancelled_discount_dollars DOUBLE ,
    ly_returned_sales_units DOUBLE ,
    ly_returned_sales_dollars DOUBLE ,
    ly_returned_discount_dollars DOUBLE ,
    lly_sold_sales_units DOUBLE ,
    lly_sold_sales_dollars DOUBLE ,
    lly_sold_discount_dollars DOUBLE ,
    lly_cancelled_sales_units DOUBLE ,
    lly_cancelled_sales_dollars DOUBLE ,
    lly_cancelled_discount_dollars DOUBLE ,
    lly_returned_sales_units DOUBLE ,
    lly_returned_sales_dollars DOUBLE ,
    lly_returned_discount_dollars DOUBLE ,
    PRIMARY KEY (fscldt_id, pos_site_id, sku_id, price_substate_id, isdiscounted)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.view_margin_byday (
    fscldt_id VARCHAR(8) NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    price_substate_id VARCHAR(3) NOT NULL,
    isdiscounted BOOLEAN NOT NULL,
    sold_asc_margin_dollars DOUBLE ,
    sold_alc_margin_dollars DOUBLE ,
    cancelled_asc_margin_dollars DOUBLE ,
    cancelled_alc_margin_dollars DOUBLE ,
    returned_asc_margin_dollars DOUBLE ,
    returned_alc_margin_dollars DOUBLE ,
    ly_sold_asc_margin_dollars DOUBLE ,
    ly_sold_alc_margin_dollars DOUBLE ,
    ly_cancelled_asc_margin_dollars DOUBLE ,
    ly_cancelled_alc_margin_dollars DOUBLE ,
    ly_returned_asc_margin_dollars DOUBLE ,
    ly_returned_alc_margin_dollars DOUBLE ,
    lly_sold_asc_margin_dollars DOUBLE ,
    lly_sold_alc_margin_dollars DOUBLE ,
    lly_cancelled_asc_margin_dollars DOUBLE ,
    lly_cancelled_alc_margin_dollars DOUBLE ,
    lly_returned_asc_margin_dollars DOUBLE ,
    lly_returned_alc_margin_dollars DOUBLE ,
    PRIMARY KEY (fscldt_id, pos_site_id, sku_id, price_substate_id, isdiscounted)
  );

CREATE TABLE IF NOT EXISTS cic_retail_bidw_data.view_salesandmargin_byday (
    fscldt_id VARCHAR(8) NOT NULL,
    pos_site_id VARCHAR(24) NOT NULL,
    sku_id VARCHAR(24) NOT NULL,
    price_substate_id VARCHAR(3) NOT NULL,
    isdiscounted BOOLEAN NOT NULL,
    sold_sales_units DOUBLE ,
    sold_sales_dollars DOUBLE ,
    sold_discount_dollars DOUBLE ,
    cancelled_sales_units DOUBLE ,
    cancelled_sales_dollars DOUBLE ,
    cancelled_discount_dollars DOUBLE ,
    returned_sales_units DOUBLE ,
    returned_sales_dollars DOUBLE ,
    returned_discount_dollars DOUBLE ,
    sold_asc_margin_dollars DOUBLE ,
    sold_alc_margin_dollars DOUBLE ,
    cancelled_asc_margin_dollars DOUBLE ,
    cancelled_alc_margin_dollars DOUBLE ,
    returned_asc_margin_dollars DOUBLE ,
    returned_alc_margin_dollars DOUBLE ,
    ly_sold_sales_units DOUBLE ,
    ly_sold_sales_dollars DOUBLE ,
    ly_sold_discount_dollars DOUBLE ,
    ly_cancelled_sales_units DOUBLE ,
    ly_cancelled_sales_dollars DOUBLE ,
    ly_cancelled_discount_dollars DOUBLE ,
    ly_returned_sales_units DOUBLE ,
    ly_returned_sales_dollars DOUBLE ,
    ly_returned_discount_dollars DOUBLE ,
    ly_sold_asc_margin_dollars DOUBLE ,
    ly_sold_alc_margin_dollars DOUBLE ,
    ly_cancelled_asc_margin_dollars DOUBLE ,
    ly_cancelled_alc_margin_dollars DOUBLE ,
    ly_returned_asc_margin_dollars DOUBLE ,
    ly_returned_alc_margin_dollars DOUBLE ,
    lly_sold_sales_units DOUBLE ,
    lly_sold_sales_dollars DOUBLE ,
    lly_sold_discount_dollars DOUBLE ,
    lly_cancelled_sales_units DOUBLE ,
    lly_cancelled_sales_dollars DOUBLE ,
    lly_cancelled_discount_dollars DOUBLE ,
    lly_returned_sales_units DOUBLE ,
    lly_returned_sales_dollars DOUBLE ,
    lly_returned_discount_dollars DOUBLE ,
    lly_sold_asc_margin_dollars DOUBLE ,
    lly_sold_alc_margin_dollars DOUBLE ,
    lly_cancelled_asc_margin_dollars DOUBLE ,
    lly_cancelled_alc_margin_dollars DOUBLE ,
    lly_returned_asc_margin_dollars DOUBLE ,
    lly_returned_alc_margin_dollars DOUBLE ,
    fscldt_label VARCHAR(12) NOT NULL,
    fsclwk_id VARCHAR(6) NOT NULL,
    fsclwk_label VARCHAR(11) NOT NULL,
    fsclmth_id VARCHAR(6) NOT NULL,
    fsclmth_label VARCHAR(9) NOT NULL,
    fsclqrtr_id VARCHAR(5) NOT NULL,
    fsclqrtr_label VARCHAR(8) NOT NULL,
    fsclyr_id VARCHAR(4) NOT NULL,
    fsclyr_label VARCHAR(4) NOT NULL,
    ssn_id VARCHAR(24) NOT NULL,
    ssn_label VARCHAR(120) NOT NULL,
    date DATE NOT NULL,
    site_label VARCHAR(120) NOT NULL,
    subchnl_id VARCHAR(24) NOT NULL,
    subchnl_label VARCHAR(120) NOT NULL,
    chnl_id VARCHAR(24) NOT NULL,
    chnl_label VARCHAR(120) NOT NULL,
    sku_label VARCHAR(120) NOT NULL,
    stylclr_id VARCHAR(24) NOT NULL,
    stylclr_label VARCHAR(120) NOT NULL,
    styl_id VARCHAR(24) NOT NULL,
    styl_label VARCHAR(120) NOT NULL,
    subcat_id VARCHAR(24) NOT NULL,
    subcat_label VARCHAR(120) NOT NULL,
    cat_id VARCHAR(24) NOT NULL,
    cat_label VARCHAR(120) NOT NULL,
    dept_id VARCHAR(24) NOT NULL,
    dept_label VARCHAR(120) NOT NULL,
    substate_label VARCHAR(120) NOT NULL,
    state_id VARCHAR(24) NOT NULL,
    state_label VARCHAR(120) NOT NULL,
    PRIMARY KEY (fscldt_id, pos_site_id, sku_id, price_substate_id, isdiscounted)
  );