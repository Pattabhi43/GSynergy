
TRUNCATE TABLE cic_retail_bidw_data.hier_prod_sku;

INSERT INTO cic_retail_bidw_data.hier_prod_sku (
    sku_id,
    sku_label,
    stylclr_id,
    stylclr_label,
    styl_id,
    styl_label,
    subcat_id,
    subcat_label,
    cat_id,
    cat_label,
    dept_id,
    dept_label,
    issvc,
    isasmbly,
    isnfs
  )
  SELECT DISTINCT
    stg.sku_id,
    stg.sku_label,
    stg.stylclr_id,
    stg.stylclr_label,
    stg.styl_id,
    stg.styl_label,
    stg.subcat_id,
    stg.subcat_label,
    stg.cat_id,
    stg.cat_label,
    stg.dept_id,
    stg.dept_label,
    stg.issvc,
    stg.isasmbly,
    stg.isnfs
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id,
    stg.cat_id,
    stg.subcat_id,
    stg.styl_id,
    stg.stylclr_id,
    stg.sku_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_prod_stylclr;

INSERT INTO cic_retail_bidw_data.hier_prod_stylclr (
    stylclr_id,
    stylclr_label,
    styl_id,
    styl_label,
    subcat_id,
    subcat_label,
    cat_id,
    cat_label,
    dept_id,
    dept_label
  )
  SELECT DISTINCT
    stg.stylclr_id,
    stg.stylclr_label,
    stg.styl_id,
    stg.styl_label,
    stg.subcat_id,
    stg.subcat_label,
    stg.cat_id,
    stg.cat_label,
    stg.dept_id,
    stg.dept_label
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id,
    stg.cat_id,
    stg.subcat_id,
    stg.styl_id,
    stg.stylclr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_prod_styl;

INSERT INTO cic_retail_bidw_data.hier_prod_styl (
    styl_id,
    styl_label,
    subcat_id,
    subcat_label,
    cat_id,
    cat_label,
    dept_id,
    dept_label
  )
  SELECT DISTINCT
    stg.styl_id,
    stg.styl_label,
    stg.subcat_id,
    stg.subcat_label,
    stg.cat_id,
    stg.cat_label,
    stg.dept_id,
    stg.dept_label
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id,
    stg.cat_id,
    stg.subcat_id,
    stg.styl_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_prod_subcat;

INSERT INTO cic_retail_bidw_data.hier_prod_subcat (
    subcat_id,
    subcat_label,
    cat_id,
    cat_label,
    dept_id,
    dept_label
  )
  SELECT DISTINCT
    stg.subcat_id,
    stg.subcat_label,
    stg.cat_id,
    stg.cat_label,
    stg.dept_id,
    stg.dept_label
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id,
    stg.cat_id,
    stg.subcat_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_prod_cat;

INSERT INTO cic_retail_bidw_data.hier_prod_cat (
    cat_id,
    cat_label,
    dept_id,
    dept_label
  )
  SELECT DISTINCT
    stg.cat_id,
    stg.cat_label,
    stg.dept_id,
    stg.dept_label
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id,
    stg.cat_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_prod_dept;

INSERT INTO cic_retail_bidw_data.hier_prod_dept (
    dept_id,
    dept_label
  )
  SELECT DISTINCT
    stg.dept_id,
    stg.dept_label
  FROM
    cic_retail_bidw_stage.stage_hier_prod stg
  ORDER BY
    stg.dept_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_invloc_loc;

INSERT INTO cic_retail_bidw_data.hier_invloc_loc (
    loc_id,
    loc_label,
    loctype_id,
    loctype_label
  )
  SELECT DISTINCT
    stg.loc_id,
    stg.loc_label,
    stg.loctype_id,
    stg.loctype_label
  FROM
    cic_retail_bidw_stage.stage_hier_invloc stg
  ORDER BY
    stg.loctype_id,
    stg.loc_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_invloc_loctype;

INSERT INTO cic_retail_bidw_data.hier_invloc_loctype (
    loctype_id,
    loctype_label
  )
  SELECT DISTINCT
    stg.loctype_id,
    stg.loctype_label
  FROM
    cic_retail_bidw_stage.stage_hier_invloc stg
  ORDER BY
    stg.loctype_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_possite_site;

INSERT INTO cic_retail_bidw_data.hier_possite_site (
    site_id,
    site_label,
    subchnl_id,
    subchnl_label,
    chnl_id,
    chnl_label
  )
  SELECT DISTINCT
    stg.site_id,
    stg.site_label,
    stg.subchnl_id,
    stg.subchnl_label,
    stg.chnl_id,
    stg.chnl_label
  FROM
    cic_retail_bidw_stage.stage_hier_possite stg
  ORDER BY
    stg.chnl_id,
    stg.subchnl_id,
    stg.site_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_possite_subchnl;

INSERT INTO cic_retail_bidw_data.hier_possite_subchnl (
    subchnl_id,
    subchnl_label,
    chnl_id,
    chnl_label
  )
  SELECT DISTINCT
    stg.subchnl_id,
    stg.subchnl_label,
    stg.chnl_id,
    stg.chnl_label
  FROM
    cic_retail_bidw_stage.stage_hier_possite stg
  ORDER BY
    stg.chnl_id,
    stg.subchnl_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_possite_chnl;

INSERT INTO cic_retail_bidw_data.hier_possite_chnl (
    chnl_id,
    chnl_label
  )
  SELECT DISTINCT
    stg.chnl_id,
    stg.chnl_label
  FROM
    cic_retail_bidw_stage.stage_hier_possite stg
  ORDER BY
    stg.chnl_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_rtlloc_str;

INSERT INTO cic_retail_bidw_data.hier_rtlloc_str (
    str_id,
    str_label,
    dstr_id,
    dstr_label,
    rgn_id,
    rgn_label
  )
  SELECT DISTINCT
    stg.str_id,
    stg.str_label,
    stg.dstr_id,
    stg.dstr_label,
    stg.rgn_id,
    stg.rgn_label
  FROM
    cic_retail_bidw_stage.stage_hier_rtlloc stg
  ORDER BY
    stg.rgn_id,
    stg.dstr_id,
    stg.str_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_rtlloc_dstr;

INSERT INTO cic_retail_bidw_data.hier_rtlloc_dstr (
    dstr_id,
    dstr_label,
    rgn_id,
    rgn_label
  )
  SELECT DISTINCT
    stg.dstr_id,
    stg.dstr_label,
    stg.rgn_id,
    stg.rgn_label
  FROM
    cic_retail_bidw_stage.stage_hier_rtlloc stg
  ORDER BY
    stg.rgn_id,
    stg.dstr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_rtlloc_rgn;

INSERT INTO cic_retail_bidw_data.hier_rtlloc_rgn (
    rgn_id,
    rgn_label
  )
  SELECT DISTINCT
    stg.rgn_id,
    stg.rgn_label
  FROM
    cic_retail_bidw_stage.stage_hier_rtlloc stg
  ORDER BY
    stg.rgn_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_fscldt;

INSERT INTO cic_retail_bidw_data.hier_clnd_fscldt (
    fscldt_id,
    fscldt_label,
    fsclwk_id,
    fsclwk_label,
    fsclmth_id,
    fsclmth_label,
    fsclqrtr_id,
    fsclqrtr_label,
    fsclyr_id,
    fsclyr_label,
    ssn_id,
    ssn_label,
    ly_fscldt_id,
    lly_fscldt_id,
    fscldow,
    fscldom,
    fscldoq,
    fscldoy,
    fsclwoy,
    fsclmoy,
    fsclqoy,
    date
  )
  SELECT DISTINCT
    stg.fscldt_id,
    stg.fscldt_label,
    stg.fsclwk_id,
    stg.fsclwk_label,
    stg.fsclmth_id,
    stg.fsclmth_label,
    stg.fsclqrtr_id,
    stg.fsclqrtr_label,
    stg.fsclyr_id,
    stg.fsclyr_label,
    stg.ssn_id,
    stg.ssn_label,
    stg.ly_fscldt_id,
    stg.lly_fscldt_id,
    stg.fscldow,
    stg.fscldom,
    stg.fscldoq,
    stg.fscldoy,
    stg.fsclwoy,
    stg.fsclmoy,
    stg.fsclqoy,
    stg.date
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  ORDER BY
    stg.date,
    stg.fscldt_id,
    stg.fsclwk_id,
    stg.fsclmth_id,
    stg.fsclqrtr_id,
    stg.fsclyr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_fsclwk;

INSERT INTO cic_retail_bidw_data.hier_clnd_fsclwk (
    fsclwk_id,
    fsclwk_label,
    fsclmth_id,
    fsclmth_label,
    fsclqrtr_id,
    fsclqrtr_label,
    fsclyr_id,
    fsclyr_label
  )
  SELECT DISTINCT
    stg.fsclwk_id,
    stg.fsclwk_label,
    stg.fsclmth_id,
    stg.fsclmth_label,
    stg.fsclqrtr_id,
    stg.fsclqrtr_label,
    stg.fsclyr_id,
    stg.fsclyr_label
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  ORDER BY
    stg.fsclwk_id,
    stg.fsclmth_id,
    stg.fsclqrtr_id,
    stg.fsclyr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_fsclmth;

INSERT INTO cic_retail_bidw_data.hier_clnd_fsclmth (
    fsclmth_id,
    fsclmth_label,
    fsclqrtr_id,
    fsclqrtr_label,
    fsclyr_id,
    fsclyr_label
  )
  SELECT DISTINCT
    stg.fsclmth_id,
    stg.fsclmth_label,
    stg.fsclqrtr_id,
    stg.fsclqrtr_label,
    stg.fsclyr_id,
    stg.fsclyr_label
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  ORDER BY
    stg.fsclmth_id,
    stg.fsclqrtr_id,
    stg.fsclyr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_fsclqrtr;

INSERT INTO cic_retail_bidw_data.hier_clnd_fsclqrtr (
    fsclqrtr_id,
    fsclqrtr_label,
    fsclyr_id,
    fsclyr_label
  )
  SELECT DISTINCT
    stg.fsclqrtr_id,
    stg.fsclqrtr_label,
    stg.fsclyr_id,
    stg.fsclyr_label
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  ORDER BY
    stg.fsclqrtr_id,
    stg.fsclyr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_fsclyr;

INSERT INTO cic_retail_bidw_data.hier_clnd_fsclyr (
    fsclyr_id,
    fsclyr_label
  )
  SELECT DISTINCT
    stg.fsclyr_id,
    stg.fsclyr_label
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  ORDER BY
    stg.fsclyr_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_clnd_ssn;

INSERT INTO cic_retail_bidw_data.hier_clnd_ssn (
    ssn_id,
    ssn_label
  )
  SELECT DISTINCT
    stg.ssn_id,
    stg.ssn_label
  FROM
    cic_retail_bidw_stage.stage_hier_clnd stg
  
    ;



TRUNCATE TABLE cic_retail_bidw_data.hier_hldy_hldy;

INSERT INTO cic_retail_bidw_data.hier_hldy_hldy (
    hldy_id,
    hldy_label
  )
  SELECT DISTINCT
    stg.hldy_id,
    stg.hldy_label
  FROM
    cic_retail_bidw_stage.stage_hier_hldy stg
  ORDER BY
    stg.hldy_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_invstatus_code;

INSERT INTO cic_retail_bidw_data.hier_invstatus_code (
    code_id,
    code_label,
    bckt_id,
    bckt_label,
    ownrshp_id,
    ownrshp_label
  )
  SELECT DISTINCT
    stg.code_id,
    stg.code_label,
    stg.bckt_id,
    stg.bckt_label,
    stg.ownrshp_id,
    stg.ownrshp_label
  FROM
    cic_retail_bidw_stage.stage_hier_invstatus stg
  ORDER BY
    stg.ownrshp_id,
    stg.bckt_id,
    stg.code_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_invstatus_bckt;

INSERT INTO cic_retail_bidw_data.hier_invstatus_bckt (
    bckt_id,
    bckt_label,
    ownrshp_id,
    ownrshp_label
  )
  SELECT DISTINCT
    stg.bckt_id,
    stg.bckt_label,
    stg.ownrshp_id,
    stg.ownrshp_label
  FROM
    cic_retail_bidw_stage.stage_hier_invstatus stg
  ORDER BY
    stg.ownrshp_id,
    stg.bckt_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_invstatus_ownrshp;

INSERT INTO cic_retail_bidw_data.hier_invstatus_ownrshp (
    ownrshp_id,
    ownrshp_label
  )
  SELECT DISTINCT
    stg.ownrshp_id,
    stg.ownrshp_label
  FROM
    cic_retail_bidw_stage.stage_hier_invstatus stg
  ORDER BY
    stg.ownrshp_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_pricestate_substate;

INSERT INTO cic_retail_bidw_data.hier_pricestate_substate (
    substate_id,
    substate_label,
    state_id,
    state_label
  )
  SELECT DISTINCT
    stg.substate_id,
    stg.substate_label,
    stg.state_id,
    stg.state_label
  FROM
    cic_retail_bidw_stage.stage_hier_pricestate stg
  ORDER BY
    stg.state_id,
    stg.substate_id;



TRUNCATE TABLE cic_retail_bidw_data.hier_pricestate_state;

INSERT INTO cic_retail_bidw_data.hier_pricestate_state (
    state_id,
    state_label
  )
  SELECT DISTINCT
    stg.state_id,
    stg.state_label
  FROM
    cic_retail_bidw_stage.stage_hier_pricestate stg
  ORDER BY
    stg.state_id;



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_transactions;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_transactions (
    fscldt_id,
    pos_site_id
  )
  SELECT DISTINCT
    fscldt_id,
    pos_site_id
  FROM
    cic_retail_bidw_stage.stage_fact_transactions
  ORDER BY
    fscldt_id,
    pos_site_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_transactions 
  USING cic_retail_bidw_stage.ovrly_fact_transactions ovr WHERE
    cic_retail_bidw_data.fact_transactions.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_transactions.pos_site_id = ovr.pos_site_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_transactions to cic_retail_bidw_data.fact_transactions
INSERT INTO cic_retail_bidw_data.fact_transactions (
    order_id,
    line_id,
    type,
    dt,
    pos_site_id,
    sku_id,
    fscldt_id,
    price_substate_id,
    sales_units,
    sales_dollars,
    discount_dollars,
    original_order_id,
    original_line_id
  )
  SELECT
    order_id,
    line_id,
    type,
    dt,
    pos_site_id,
    sku_id,
    fscldt_id,
    price_substate_id,
    sales_units,
    sales_dollars,
    discount_dollars,
    original_order_id,
    original_line_id
  FROM
    cic_retail_bidw_stage.stage_fact_transactions;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_transactions
  WHERE cic_retail_bidw_data.fact_transactions.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_pricestate_substate
DELETE 
  FROM cic_retail_bidw_data.fact_transactions
  WHERE cic_retail_bidw_data.fact_transactions.price_substate_id NOT IN (
    SELECT DISTINCT substate_id FROM cic_retail_bidw_data.hier_pricestate_substate
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_possite_site
DELETE 
  FROM cic_retail_bidw_data.fact_transactions
  WHERE cic_retail_bidw_data.fact_transactions.pos_site_id NOT IN (
    SELECT DISTINCT site_id FROM cic_retail_bidw_data.hier_possite_site
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_transactions
  WHERE cic_retail_bidw_data.fact_transactions.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_averagecosts;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_averagecosts (
    fscldt_id
  )
  SELECT DISTINCT
    fscldt_id
  FROM
    cic_retail_bidw_stage.stage_fact_averagecosts
  ORDER BY
    fscldt_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_averagecosts 
  USING cic_retail_bidw_stage.ovrly_fact_averagecosts ovr WHERE
    cic_retail_bidw_data.fact_averagecosts.fscldt_id = ovr.fscldt_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_averagecosts to cic_retail_bidw_data.fact_averagecosts
INSERT INTO cic_retail_bidw_data.fact_averagecosts (
    fscldt_id,
    sku_id,
    average_unit_standardcost,
    average_unit_landedcost
  )
  SELECT
    fscldt_id,
    sku_id,
    average_unit_standardcost,
    average_unit_landedcost
  FROM
    cic_retail_bidw_stage.stage_fact_averagecosts;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_averagecosts
  WHERE cic_retail_bidw_data.fact_averagecosts.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_averagecosts
  WHERE cic_retail_bidw_data.fact_averagecosts.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_ships;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_ships (
    fscldt_id,
    invloc_loc_id
  )
  SELECT DISTINCT
    fscldt_id,
    invloc_loc_id
  FROM
    cic_retail_bidw_stage.stage_fact_ships
  ORDER BY
    fscldt_id,
    invloc_loc_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_ships 
  USING cic_retail_bidw_stage.ovrly_fact_ships ovr WHERE
    cic_retail_bidw_data.fact_ships.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_ships.invloc_loc_id = ovr.invloc_loc_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_ships to cic_retail_bidw_data.fact_ships
INSERT INTO cic_retail_bidw_data.fact_ships (
    order_id,
    line_id,
    ship_type,
    invloc_loc_id,
    dt,
    fscldt_id,
    sku_id,
    quantity
  )
  SELECT
    order_id,
    line_id,
    ship_type,
    invloc_loc_id,
    dt,
    fscldt_id,
    sku_id,
    quantity
  FROM
    cic_retail_bidw_stage.stage_fact_ships;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_ships
  WHERE cic_retail_bidw_data.fact_ships.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_onhandinventory;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_onhandinventory (
    fscldt_id,
    invloc_loc_id
  )
  SELECT DISTINCT
    fscldt_id,
    invloc_loc_id
  FROM
    cic_retail_bidw_stage.stage_fact_onhandinventory
  ORDER BY
    fscldt_id,
    invloc_loc_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_onhandinventory 
  USING cic_retail_bidw_stage.ovrly_fact_onhandinventory ovr WHERE
    cic_retail_bidw_data.fact_onhandinventory.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_onhandinventory.invloc_loc_id = ovr.invloc_loc_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_onhandinventory to cic_retail_bidw_data.fact_onhandinventory
INSERT INTO cic_retail_bidw_data.fact_onhandinventory (
    fscldt_id,
    sku_id,
    invloc_loc_id,
    invstatus_code,
    eopquantity
  )
  SELECT
    fscldt_id,
    sku_id,
    invloc_loc_id,
    invstatus_code,
    eopquantity
  FROM
    cic_retail_bidw_stage.stage_fact_onhandinventory;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_onhandinventory
  WHERE cic_retail_bidw_data.fact_onhandinventory.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_onhandinventory
  WHERE cic_retail_bidw_data.fact_onhandinventory.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invloc_loc
DELETE 
  FROM cic_retail_bidw_data.fact_onhandinventory
  WHERE cic_retail_bidw_data.fact_onhandinventory.invloc_loc_id NOT IN (
    SELECT DISTINCT loc_id FROM cic_retail_bidw_data.hier_invloc_loc
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invstatus_code
DELETE 
  FROM cic_retail_bidw_data.fact_onhandinventory
  WHERE cic_retail_bidw_data.fact_onhandinventory.invstatus_code NOT IN (
    SELECT DISTINCT code_id FROM cic_retail_bidw_data.hier_invstatus_code
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_intransit;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_intransit (
    fscldt_id,
    loc_from
  )
  SELECT DISTINCT
    fscldt_id,
    loc_from
  FROM
    cic_retail_bidw_stage.stage_fact_intransit
  ORDER BY
    fscldt_id,
    loc_from;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_intransit 
  USING cic_retail_bidw_stage.ovrly_fact_intransit ovr WHERE
    cic_retail_bidw_data.fact_intransit.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_intransit.loc_from = ovr.loc_from;


-- Copy data from cic_retail_bidw_stage.stage_fact_intransit to cic_retail_bidw_data.fact_intransit
INSERT INTO cic_retail_bidw_data.fact_intransit (
    fscldt_id,
    loc_from,
    loc_to,
    sku_id,
    invstatus_code,
    eopquantity
  )
  SELECT
    fscldt_id,
    loc_from,
    loc_to,
    sku_id,
    invstatus_code,
    eopquantity
  FROM
    cic_retail_bidw_stage.stage_fact_intransit;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_intransit
  WHERE cic_retail_bidw_data.fact_intransit.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invloc_loc
DELETE 
  FROM cic_retail_bidw_data.fact_intransit
  WHERE cic_retail_bidw_data.fact_intransit.loc_to NOT IN (
    SELECT DISTINCT loc_id FROM cic_retail_bidw_data.hier_invloc_loc
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invstatus_code
DELETE 
  FROM cic_retail_bidw_data.fact_intransit
  WHERE cic_retail_bidw_data.fact_intransit.invstatus_code NOT IN (
    SELECT DISTINCT code_id FROM cic_retail_bidw_data.hier_invstatus_code
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_intransit
  WHERE cic_retail_bidw_data.fact_intransit.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invloc_loc
DELETE 
  FROM cic_retail_bidw_data.fact_intransit
  WHERE cic_retail_bidw_data.fact_intransit.loc_from NOT IN (
    SELECT DISTINCT loc_id FROM cic_retail_bidw_data.hier_invloc_loc
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_onorder;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_onorder (
    fscldt_id,
    invloc_loc_id
  )
  SELECT DISTINCT
    fscldt_id,
    invloc_loc_id
  FROM
    cic_retail_bidw_stage.stage_fact_onorder
  ORDER BY
    fscldt_id,
    invloc_loc_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_onorder 
  USING cic_retail_bidw_stage.ovrly_fact_onorder ovr WHERE
    cic_retail_bidw_data.fact_onorder.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_onorder.invloc_loc_id = ovr.invloc_loc_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_onorder to cic_retail_bidw_data.fact_onorder
INSERT INTO cic_retail_bidw_data.fact_onorder (
    fscldt_id,
    po_id,
    shipmentnumber,
    sku_id,
    invloc_loc_id,
    invstatus_code,
    eopquantity,
    expectedinhousedate
  )
  SELECT
    fscldt_id,
    po_id,
    shipmentnumber,
    sku_id,
    invloc_loc_id,
    invstatus_code,
    eopquantity,
    expectedinhousedate
  FROM
    cic_retail_bidw_stage.stage_fact_onorder;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_onorder
  WHERE cic_retail_bidw_data.fact_onorder.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_onorder
  WHERE cic_retail_bidw_data.fact_onorder.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invloc_loc
DELETE 
  FROM cic_retail_bidw_data.fact_onorder
  WHERE cic_retail_bidw_data.fact_onorder.invloc_loc_id NOT IN (
    SELECT DISTINCT loc_id FROM cic_retail_bidw_data.hier_invloc_loc
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invstatus_code
DELETE 
  FROM cic_retail_bidw_data.fact_onorder
  WHERE cic_retail_bidw_data.fact_onorder.invstatus_code NOT IN (
    SELECT DISTINCT code_id FROM cic_retail_bidw_data.hier_invstatus_code
  );



-- Truncate overlay table
TRUNCATE TABLE cic_retail_bidw_stage.ovrly_fact_receipts;

-- Select distinct intersections along which data is being loaded
INSERT INTO cic_retail_bidw_stage.ovrly_fact_receipts (
    fscldt_id,
    invloc_loc_id
  )
  SELECT DISTINCT
    fscldt_id,
    invloc_loc_id
  FROM
    cic_retail_bidw_stage.stage_fact_receipts
  ORDER BY
    fscldt_id,
    invloc_loc_id;

-- Delete loading overlay intersection from existing facts
DELETE FROM cic_retail_bidw_data.fact_receipts 
  USING cic_retail_bidw_stage.ovrly_fact_receipts ovr WHERE
    cic_retail_bidw_data.fact_receipts.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.fact_receipts.invloc_loc_id = ovr.invloc_loc_id;


-- Copy data from cic_retail_bidw_stage.stage_fact_receipts to cic_retail_bidw_data.fact_receipts
INSERT INTO cic_retail_bidw_data.fact_receipts (
    fscldt_id,
    po_id,
    sku_id,
    invloc_loc_id,
    quantity
  )
  SELECT
    fscldt_id,
    po_id,
    sku_id,
    invloc_loc_id,
    quantity
  FROM
    cic_retail_bidw_stage.stage_fact_receipts;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE 
  FROM cic_retail_bidw_data.fact_receipts
  WHERE cic_retail_bidw_data.fact_receipts.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE 
  FROM cic_retail_bidw_data.fact_receipts
  WHERE cic_retail_bidw_data.fact_receipts.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_invloc_loc
DELETE 
  FROM cic_retail_bidw_data.fact_receipts
  WHERE cic_retail_bidw_data.fact_receipts.invloc_loc_id NOT IN (
    SELECT DISTINCT loc_id FROM cic_retail_bidw_data.hier_invloc_loc
  );



-- Delete loading overlay intersection from the view
DELETE FROM cic_retail_bidw_data.view_sales_byday
  USING cic_retail_bidw_stage.ovrly_fact_transactions ovr WHERE
    cic_retail_bidw_data.view_sales_byday.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.view_sales_byday.pos_site_id = ovr.pos_site_id;


-- Reset LY columns where loaded dates are use as LY values
UPDATE cic_retail_bidw_data.view_sales_byday
  SET
    ly_sold_sales_units = 0,
    ly_sold_sales_dollars = 0,
    ly_sold_discount_dollars = 0,
    ly_cancelled_sales_units = 0,
    ly_cancelled_sales_dollars = 0,
    ly_cancelled_discount_dollars = 0,
    ly_returned_sales_units = 0,
    ly_returned_sales_dollars = 0,
    ly_returned_discount_dollars = 0
  WHERE (
    fscldt_id,
    pos_site_id
  ) IN (
    SELECT DISTINCT
      hcf.fscldt_id,
      oft.pos_site_id
    FROM
      cic_retail_bidw_data.hier_clnd_fscldt hcf,
      cic_retail_bidw_stage.ovrly_fact_transactions oft
    WHERE 
      hcf.ly_fscldt_id = oft.fscldt_id
  );


-- Reset LLY columns where loaded dates are use as LLY values
UPDATE cic_retail_bidw_data.view_sales_byday
  SET
    lly_sold_sales_units = 0,
    lly_sold_sales_dollars = 0,
    lly_sold_discount_dollars = 0,
    lly_cancelled_sales_units = 0,
    lly_cancelled_sales_dollars = 0,
    lly_cancelled_discount_dollars = 0,
    lly_returned_sales_units = 0,
    lly_returned_sales_dollars = 0,
    lly_returned_discount_dollars = 0
  WHERE (
    fscldt_id,
    pos_site_id
  ) IN (
    SELECT DISTINCT
      hcf.fscldt_id,
      oft.pos_site_id
    FROM
      cic_retail_bidw_data.hier_clnd_fscldt hcf,
      cic_retail_bidw_stage.ovrly_fact_transactions oft
    WHERE 
      hcf.lly_fscldt_id = oft.fscldt_id
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE FROM cic_retail_bidw_data.view_sales_byday
  WHERE cic_retail_bidw_data.view_sales_byday.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_possite_site
DELETE FROM cic_retail_bidw_data.view_sales_byday
  WHERE cic_retail_bidw_data.view_sales_byday.pos_site_id NOT IN (
    SELECT DISTINCT site_id FROM cic_retail_bidw_data.hier_possite_site
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE FROM cic_retail_bidw_data.view_sales_byday
  WHERE cic_retail_bidw_data.view_sales_byday.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_pricestate_substate
DELETE FROM cic_retail_bidw_data.view_sales_byday
  WHERE cic_retail_bidw_data.view_sales_byday.price_substate_id NOT IN (
    SELECT DISTINCT substate_id FROM cic_retail_bidw_data.hier_pricestate_substate
  );


-- Insert new records
INSERT INTO cic_retail_bidw_data.view_sales_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted,
    sold_sales_units,
    sold_sales_dollars,
    sold_discount_dollars,
    cancelled_sales_units,
    cancelled_sales_dollars,
    cancelled_discount_dollars,
    returned_sales_units,
    returned_sales_dollars,
    returned_discount_dollars
  )
  SELECT 
    txns.fscldt_id,
    txns.pos_site_id,
    txns.sku_id,
    txns.price_substate_id,
    CASE WHEN NVL(txns.discount_dollars, 0) = 0 THEN FALSE ELSE TRUE END,
    SUM(CASE WHEN txns.type = 'Sale' THEN txns.sales_units ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Sale' THEN txns.sales_dollars ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Sale' THEN txns.discount_dollars ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Cancel' THEN txns.sales_units ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Cancel' THEN txns.sales_dollars ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Cancel' THEN txns.discount_dollars ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Return' THEN txns.sales_units ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Return' THEN txns.sales_dollars ELSE 0 END),
    SUM(CASE WHEN txns.type = 'Return' THEN txns.discount_dollars ELSE 0 END)
  FROM
    cic_retail_bidw_data.fact_transactions txns
  
    
  GROUP BY
    txns.fscldt_id,
    txns.pos_site_id,
    txns.sku_id,
    txns.price_substate_id,
    CASE WHEN NVL(txns.discount_dollars, 0) = 0 THEN FALSE ELSE TRUE END
  ORDER BY
    txns.fscldt_id,
    txns.pos_site_id,
    txns.sku_id,
    txns.price_substate_id,
    CASE WHEN NVL(txns.discount_dollars, 0) = 0 THEN FALSE ELSE TRUE END;


INSERT INTO cic_retail_bidw_data.view_sales_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_sales_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.ly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_sales_byday
      )
    AND
      (
        hcf.ly_fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );

INSERT INTO cic_retail_bidw_data.view_sales_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_sales_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.ly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_sales_byday
      )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );


INSERT INTO cic_retail_bidw_data.view_sales_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_sales_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.lly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_sales_byday
      )
    AND
      (
        hcf.lly_fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );

INSERT INTO cic_retail_bidw_data.view_sales_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_sales_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.lly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_sales_byday
      )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );


UPDATE cic_retail_bidw_data.view_sales_byday
  SET 
    ly_sold_sales_units = t.sold_sales_units,
    ly_sold_sales_dollars = t.sold_sales_dollars,
    ly_sold_discount_dollars = t.sold_discount_dollars,
    ly_cancelled_sales_units = t.cancelled_sales_units,
    ly_cancelled_sales_dollars = t.cancelled_sales_dollars,
    ly_cancelled_discount_dollars = t.cancelled_discount_dollars,
    ly_returned_sales_units = t.returned_sales_units,
    ly_returned_sales_dollars = t.returned_sales_dollars,
    ly_returned_discount_dollars = t.returned_discount_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_sales_units,
      sold_sales_dollars,
      sold_discount_dollars,
      cancelled_sales_units,
      cancelled_sales_dollars,
      cancelled_discount_dollars,
      returned_sales_units,
      returned_sales_dollars,
      returned_discount_dollars
    FROM
      cic_retail_bidw_data.view_sales_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.ly_fscldt_id = cic_retail_bidw_data.view_sales_byday.fscldt_id 
      AND (
        hcf.ly_fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_sales_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_sales_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_sales_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_sales_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_sales_byday.isdiscounted = t.isdiscounted;

UPDATE cic_retail_bidw_data.view_sales_byday
  SET 
    ly_sold_sales_units = t.sold_sales_units,
    ly_sold_sales_dollars = t.sold_sales_dollars,
    ly_sold_discount_dollars = t.sold_discount_dollars,
    ly_cancelled_sales_units = t.cancelled_sales_units,
    ly_cancelled_sales_dollars = t.cancelled_sales_dollars,
    ly_cancelled_discount_dollars = t.cancelled_discount_dollars,
    ly_returned_sales_units = t.returned_sales_units,
    ly_returned_sales_dollars = t.returned_sales_dollars,
    ly_returned_discount_dollars = t.returned_discount_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_sales_units,
      sold_sales_dollars,
      sold_discount_dollars,
      cancelled_sales_units,
      cancelled_sales_dollars,
      cancelled_discount_dollars,
      returned_sales_units,
      returned_sales_dollars,
      returned_discount_dollars
    FROM
      cic_retail_bidw_data.view_sales_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.ly_fscldt_id = cic_retail_bidw_data.view_sales_byday.fscldt_id 
      AND (
        hcf.fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_sales_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_sales_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_sales_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_sales_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_sales_byday.isdiscounted = t.isdiscounted;


UPDATE cic_retail_bidw_data.view_sales_byday
  SET 
    lly_sold_sales_units = t.sold_sales_units,
    lly_sold_sales_dollars = t.sold_sales_dollars,
    lly_sold_discount_dollars = t.sold_discount_dollars,
    lly_cancelled_sales_units = t.cancelled_sales_units,
    lly_cancelled_sales_dollars = t.cancelled_sales_dollars,
    lly_cancelled_discount_dollars = t.cancelled_discount_dollars,
    lly_returned_sales_units = t.returned_sales_units,
    lly_returned_sales_dollars = t.returned_sales_dollars,
    lly_returned_discount_dollars = t.returned_discount_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_sales_units,
      sold_sales_dollars,
      sold_discount_dollars,
      cancelled_sales_units,
      cancelled_sales_dollars,
      cancelled_discount_dollars,
      returned_sales_units,
      returned_sales_dollars,
      returned_discount_dollars
    FROM
      cic_retail_bidw_data.view_sales_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.lly_fscldt_id = cic_retail_bidw_data.view_sales_byday.fscldt_id 
      AND (
        hcf.lly_fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_sales_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_sales_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_sales_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_sales_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_sales_byday.isdiscounted = t.isdiscounted;

UPDATE cic_retail_bidw_data.view_sales_byday
  SET 
    lly_sold_sales_units = t.sold_sales_units,
    lly_sold_sales_dollars = t.sold_sales_dollars,
    lly_sold_discount_dollars = t.sold_discount_dollars,
    lly_cancelled_sales_units = t.cancelled_sales_units,
    lly_cancelled_sales_dollars = t.cancelled_sales_dollars,
    lly_cancelled_discount_dollars = t.cancelled_discount_dollars,
    lly_returned_sales_units = t.returned_sales_units,
    lly_returned_sales_dollars = t.returned_sales_dollars,
    lly_returned_discount_dollars = t.returned_discount_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_sales_units,
      sold_sales_dollars,
      sold_discount_dollars,
      cancelled_sales_units,
      cancelled_sales_dollars,
      cancelled_discount_dollars,
      returned_sales_units,
      returned_sales_dollars,
      returned_discount_dollars
    FROM
      cic_retail_bidw_data.view_sales_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.lly_fscldt_id = cic_retail_bidw_data.view_sales_byday.fscldt_id 
      AND (
        hcf.fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_sales_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_sales_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_sales_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_sales_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_sales_byday.isdiscounted = t.isdiscounted;


DELETE FROM cic_retail_bidw_data.view_sales_byday
  WHERE
    sold_sales_units IS NULL AND
    sold_sales_dollars IS NULL AND
    sold_discount_dollars IS NULL AND
    cancelled_sales_units IS NULL AND
    cancelled_sales_dollars IS NULL AND
    cancelled_discount_dollars IS NULL AND
    returned_sales_units IS NULL AND
    returned_sales_dollars IS NULL AND
    returned_discount_dollars IS NULL AND
    ly_sold_sales_units IS NULL AND
    ly_sold_sales_dollars IS NULL AND
    ly_sold_discount_dollars IS NULL AND
    ly_cancelled_sales_units IS NULL AND
    ly_cancelled_sales_dollars IS NULL AND
    ly_cancelled_discount_dollars IS NULL AND
    ly_returned_sales_units IS NULL AND
    ly_returned_sales_dollars IS NULL AND
    ly_returned_discount_dollars IS NULL AND
    lly_sold_sales_units IS NULL AND
    lly_sold_sales_dollars IS NULL AND
    lly_sold_discount_dollars IS NULL AND
    lly_cancelled_sales_units IS NULL AND
    lly_cancelled_sales_dollars IS NULL AND
    lly_cancelled_discount_dollars IS NULL AND
    lly_returned_sales_units IS NULL AND
    lly_returned_sales_dollars IS NULL AND
    lly_returned_discount_dollars IS NULL;



-- Delete loading overlay intersection from the view
DELETE FROM cic_retail_bidw_data.view_margin_byday
  USING cic_retail_bidw_stage.ovrly_fact_transactions ovr WHERE
    cic_retail_bidw_data.view_margin_byday.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.view_margin_byday.pos_site_id = ovr.pos_site_id;


-- Reset LY columns where loaded dates are use as LY values
UPDATE cic_retail_bidw_data.view_margin_byday
  SET
    ly_sold_asc_margin_dollars = 0,
    ly_sold_alc_margin_dollars = 0,
    ly_cancelled_asc_margin_dollars = 0,
    ly_cancelled_alc_margin_dollars = 0,
    ly_returned_asc_margin_dollars = 0,
    ly_returned_alc_margin_dollars = 0
  WHERE (
    fscldt_id,
    pos_site_id
  ) IN (
    SELECT DISTINCT
      hcf.fscldt_id,
      oft.pos_site_id
    FROM
      cic_retail_bidw_data.hier_clnd_fscldt hcf,
      cic_retail_bidw_stage.ovrly_fact_transactions oft
    WHERE 
      hcf.ly_fscldt_id = oft.fscldt_id
  );


-- Reset LLY columns where loaded dates are use as LLY values
UPDATE cic_retail_bidw_data.view_margin_byday
  SET
    lly_sold_asc_margin_dollars = 0,
    lly_sold_alc_margin_dollars = 0,
    lly_cancelled_asc_margin_dollars = 0,
    lly_cancelled_alc_margin_dollars = 0,
    lly_returned_asc_margin_dollars = 0,
    lly_returned_alc_margin_dollars = 0
  WHERE (
    fscldt_id,
    pos_site_id
  ) IN (
    SELECT DISTINCT
      hcf.fscldt_id,
      oft.pos_site_id
    FROM
      cic_retail_bidw_data.hier_clnd_fscldt hcf,
      cic_retail_bidw_stage.ovrly_fact_transactions oft
    WHERE 
      hcf.lly_fscldt_id = oft.fscldt_id
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE FROM cic_retail_bidw_data.view_margin_byday
  WHERE cic_retail_bidw_data.view_margin_byday.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_possite_site
DELETE FROM cic_retail_bidw_data.view_margin_byday
  WHERE cic_retail_bidw_data.view_margin_byday.pos_site_id NOT IN (
    SELECT DISTINCT site_id FROM cic_retail_bidw_data.hier_possite_site
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE FROM cic_retail_bidw_data.view_margin_byday
  WHERE cic_retail_bidw_data.view_margin_byday.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_pricestate_substate
DELETE FROM cic_retail_bidw_data.view_margin_byday
  WHERE cic_retail_bidw_data.view_margin_byday.price_substate_id NOT IN (
    SELECT DISTINCT substate_id FROM cic_retail_bidw_data.hier_pricestate_substate
  );


-- Insert new records
INSERT INTO cic_retail_bidw_data.view_margin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted,
    sold_asc_margin_dollars,
    sold_alc_margin_dollars,
    cancelled_asc_margin_dollars,
    cancelled_alc_margin_dollars,
    returned_asc_margin_dollars,
    returned_alc_margin_dollars
  )
  SELECT 
    sls.fscldt_id,
    sls.pos_site_id,
    sls.sku_id,
    sls.price_substate_id,
    sls.isdiscounted,
    sls.sold_sales_dollars - sls.sold_sales_units * NVL(avc.average_unit_standardcost, 0),
    sls.sold_sales_dollars - sls.sold_sales_units * NVL(avc.average_unit_landedcost, 0),
    sls.cancelled_sales_dollars - sls.cancelled_sales_units * NVL(avc.average_unit_standardcost, 0),
    sls.cancelled_sales_dollars - sls.cancelled_sales_units * NVL(avc.average_unit_landedcost, 0),
    sls.returned_sales_dollars - sls.returned_sales_units * NVL(avc.average_unit_standardcost, 0),
    sls.returned_sales_dollars - sls.returned_sales_units * NVL(avc.average_unit_landedcost, 0)
  FROM
    cic_retail_bidw_data.view_sales_byday sls LEFT JOIN cic_retail_bidw_data.fact_averagecosts avc ON (avc.fscldt_id = sls.fscldt_id AND avc.sku_id = sls.sku_id)
  
    
  
    
  ORDER BY
    sls.fscldt_id,
    sls.pos_site_id,
    sls.sku_id,
    sls.price_substate_id,
    sls.isdiscounted;


INSERT INTO cic_retail_bidw_data.view_margin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_margin_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.ly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_margin_byday
      )
    AND
      (
        hcf.ly_fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );

INSERT INTO cic_retail_bidw_data.view_margin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_margin_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.ly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_margin_byday
      )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );


INSERT INTO cic_retail_bidw_data.view_margin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_margin_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.lly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_margin_byday
      )
    AND
      (
        hcf.lly_fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );

INSERT INTO cic_retail_bidw_data.view_margin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted )
  SELECT
      hcf.fscldt_id,
      tbl.pos_site_id,
      tbl.sku_id,
      tbl.price_substate_id,
      tbl.isdiscounted
    FROM
      cic_retail_bidw_data.view_margin_byday tbl,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE (
      tbl.fscldt_id = hcf.lly_fscldt_id
    )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id,
        tbl.sku_id,
        tbl.price_substate_id,
        tbl.isdiscounted
      )
      NOT IN (
        SELECT
          fscldt_id,
          pos_site_id,
          sku_id,
          price_substate_id,
          isdiscounted
        FROM cic_retail_bidw_data.view_margin_byday
      )
    AND
      (
        hcf.fscldt_id,
        tbl.pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      );


UPDATE cic_retail_bidw_data.view_margin_byday
  SET 
    ly_sold_asc_margin_dollars = t.sold_asc_margin_dollars,
    ly_sold_alc_margin_dollars = t.sold_alc_margin_dollars,
    ly_cancelled_asc_margin_dollars = t.cancelled_asc_margin_dollars,
    ly_cancelled_alc_margin_dollars = t.cancelled_alc_margin_dollars,
    ly_returned_asc_margin_dollars = t.returned_asc_margin_dollars,
    ly_returned_alc_margin_dollars = t.returned_alc_margin_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_asc_margin_dollars,
      sold_alc_margin_dollars,
      cancelled_asc_margin_dollars,
      cancelled_alc_margin_dollars,
      returned_asc_margin_dollars,
      returned_alc_margin_dollars
    FROM
      cic_retail_bidw_data.view_margin_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.ly_fscldt_id = cic_retail_bidw_data.view_margin_byday.fscldt_id 
      AND (
        hcf.ly_fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_margin_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_margin_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_margin_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_margin_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_margin_byday.isdiscounted = t.isdiscounted;

UPDATE cic_retail_bidw_data.view_margin_byday
  SET 
    ly_sold_asc_margin_dollars = t.sold_asc_margin_dollars,
    ly_sold_alc_margin_dollars = t.sold_alc_margin_dollars,
    ly_cancelled_asc_margin_dollars = t.cancelled_asc_margin_dollars,
    ly_cancelled_alc_margin_dollars = t.cancelled_alc_margin_dollars,
    ly_returned_asc_margin_dollars = t.returned_asc_margin_dollars,
    ly_returned_alc_margin_dollars = t.returned_alc_margin_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_asc_margin_dollars,
      sold_alc_margin_dollars,
      cancelled_asc_margin_dollars,
      cancelled_alc_margin_dollars,
      returned_asc_margin_dollars,
      returned_alc_margin_dollars
    FROM
      cic_retail_bidw_data.view_margin_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.ly_fscldt_id = cic_retail_bidw_data.view_margin_byday.fscldt_id 
      AND (
        hcf.fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_margin_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_margin_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_margin_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_margin_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_margin_byday.isdiscounted = t.isdiscounted;


UPDATE cic_retail_bidw_data.view_margin_byday
  SET 
    lly_sold_asc_margin_dollars = t.sold_asc_margin_dollars,
    lly_sold_alc_margin_dollars = t.sold_alc_margin_dollars,
    lly_cancelled_asc_margin_dollars = t.cancelled_asc_margin_dollars,
    lly_cancelled_alc_margin_dollars = t.cancelled_alc_margin_dollars,
    lly_returned_asc_margin_dollars = t.returned_asc_margin_dollars,
    lly_returned_alc_margin_dollars = t.returned_alc_margin_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_asc_margin_dollars,
      sold_alc_margin_dollars,
      cancelled_asc_margin_dollars,
      cancelled_alc_margin_dollars,
      returned_asc_margin_dollars,
      returned_alc_margin_dollars
    FROM
      cic_retail_bidw_data.view_margin_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.lly_fscldt_id = cic_retail_bidw_data.view_margin_byday.fscldt_id 
      AND (
        hcf.lly_fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_margin_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_margin_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_margin_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_margin_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_margin_byday.isdiscounted = t.isdiscounted;

UPDATE cic_retail_bidw_data.view_margin_byday
  SET 
    lly_sold_asc_margin_dollars = t.sold_asc_margin_dollars,
    lly_sold_alc_margin_dollars = t.sold_alc_margin_dollars,
    lly_cancelled_asc_margin_dollars = t.cancelled_asc_margin_dollars,
    lly_cancelled_alc_margin_dollars = t.cancelled_alc_margin_dollars,
    lly_returned_asc_margin_dollars = t.returned_asc_margin_dollars,
    lly_returned_alc_margin_dollars = t.returned_alc_margin_dollars
  FROM (
    SELECT
      hcf.fscldt_id,
      pos_site_id,
      sku_id,
      price_substate_id,
      isdiscounted,
      sold_asc_margin_dollars,
      sold_alc_margin_dollars,
      cancelled_asc_margin_dollars,
      cancelled_alc_margin_dollars,
      returned_asc_margin_dollars,
      returned_alc_margin_dollars
    FROM
      cic_retail_bidw_data.view_margin_byday,
      cic_retail_bidw_data.hier_clnd_fscldt hcf
    WHERE
      hcf.lly_fscldt_id = cic_retail_bidw_data.view_margin_byday.fscldt_id 
      AND (
        hcf.fscldt_id,
        pos_site_id
      )
      IN (
        SELECT
          fscldt_id,
          pos_site_id
        FROM
          cic_retail_bidw_stage.ovrly_fact_transactions
      )
  ) t  
  WHERE
    cic_retail_bidw_data.view_margin_byday.fscldt_id = t.fscldt_id AND
    cic_retail_bidw_data.view_margin_byday.pos_site_id = t.pos_site_id AND
    cic_retail_bidw_data.view_margin_byday.sku_id = t.sku_id AND
    cic_retail_bidw_data.view_margin_byday.price_substate_id = t.price_substate_id AND
    cic_retail_bidw_data.view_margin_byday.isdiscounted = t.isdiscounted;


DELETE FROM cic_retail_bidw_data.view_margin_byday
  WHERE
    sold_asc_margin_dollars IS NULL AND
    sold_alc_margin_dollars IS NULL AND
    cancelled_asc_margin_dollars IS NULL AND
    cancelled_alc_margin_dollars IS NULL AND
    returned_asc_margin_dollars IS NULL AND
    returned_alc_margin_dollars IS NULL AND
    ly_sold_asc_margin_dollars IS NULL AND
    ly_sold_alc_margin_dollars IS NULL AND
    ly_cancelled_asc_margin_dollars IS NULL AND
    ly_cancelled_alc_margin_dollars IS NULL AND
    ly_returned_asc_margin_dollars IS NULL AND
    ly_returned_alc_margin_dollars IS NULL AND
    lly_sold_asc_margin_dollars IS NULL AND
    lly_sold_alc_margin_dollars IS NULL AND
    lly_cancelled_asc_margin_dollars IS NULL AND
    lly_cancelled_alc_margin_dollars IS NULL AND
    lly_returned_asc_margin_dollars IS NULL AND
    lly_returned_alc_margin_dollars IS NULL;



-- Delete loading overlay intersection from the view
DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  USING cic_retail_bidw_stage.ovrly_fact_transactions ovr WHERE
    cic_retail_bidw_data.view_salesandmargin_byday.fscldt_id = ovr.fscldt_id AND
    cic_retail_bidw_data.view_salesandmargin_byday.pos_site_id = ovr.pos_site_id;


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_clnd_fscldt
DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  WHERE cic_retail_bidw_data.view_salesandmargin_byday.fscldt_id NOT IN (
    SELECT DISTINCT fscldt_id FROM cic_retail_bidw_data.hier_clnd_fscldt
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_possite_site
DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  WHERE cic_retail_bidw_data.view_salesandmargin_byday.pos_site_id NOT IN (
    SELECT DISTINCT site_id FROM cic_retail_bidw_data.hier_possite_site
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_prod_sku
DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  WHERE cic_retail_bidw_data.view_salesandmargin_byday.sku_id NOT IN (
    SELECT DISTINCT sku_id FROM cic_retail_bidw_data.hier_prod_sku
  );


-- Delete existing facts for positions that no longer exist in cic_retail_bidw_data.hier_pricestate_substate
DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  WHERE cic_retail_bidw_data.view_salesandmargin_byday.price_substate_id NOT IN (
    SELECT DISTINCT substate_id FROM cic_retail_bidw_data.hier_pricestate_substate
  );


-- Insert new records
INSERT INTO cic_retail_bidw_data.view_salesandmargin_byday (
    fscldt_id,
    pos_site_id,
    sku_id,
    price_substate_id,
    isdiscounted,
    sold_sales_units,
    sold_sales_dollars,
    sold_discount_dollars,
    cancelled_sales_units,
    cancelled_sales_dollars,
    cancelled_discount_dollars,
    returned_sales_units,
    returned_sales_dollars,
    returned_discount_dollars,
    sold_asc_margin_dollars,
    sold_alc_margin_dollars,
    cancelled_asc_margin_dollars,
    cancelled_alc_margin_dollars,
    returned_asc_margin_dollars,
    returned_alc_margin_dollars,
    ly_sold_sales_units,
    ly_sold_sales_dollars,
    ly_sold_discount_dollars,
    ly_cancelled_sales_units,
    ly_cancelled_sales_dollars,
    ly_cancelled_discount_dollars,
    ly_returned_sales_units,
    ly_returned_sales_dollars,
    ly_returned_discount_dollars,
    ly_sold_asc_margin_dollars,
    ly_sold_alc_margin_dollars,
    ly_cancelled_asc_margin_dollars,
    ly_cancelled_alc_margin_dollars,
    ly_returned_asc_margin_dollars,
    ly_returned_alc_margin_dollars,
    lly_sold_sales_units,
    lly_sold_sales_dollars,
    lly_sold_discount_dollars,
    lly_cancelled_sales_units,
    lly_cancelled_sales_dollars,
    lly_cancelled_discount_dollars,
    lly_returned_sales_units,
    lly_returned_sales_dollars,
    lly_returned_discount_dollars,
    lly_sold_asc_margin_dollars,
    lly_sold_alc_margin_dollars,
    lly_cancelled_asc_margin_dollars,
    lly_cancelled_alc_margin_dollars,
    lly_returned_asc_margin_dollars,
    lly_returned_alc_margin_dollars,
    fscldt_label,
    fsclwk_id,
    fsclwk_label,
    fsclmth_id,
    fsclmth_label,
    fsclqrtr_id,
    fsclqrtr_label,
    fsclyr_id,
    fsclyr_label,
    ssn_id,
    ssn_label,
    date,
    site_label,
    subchnl_id,
    subchnl_label,
    chnl_id,
    chnl_label,
    sku_label,
    stylclr_id,
    stylclr_label,
    styl_id,
    styl_label,
    subcat_id,
    subcat_label,
    cat_id,
    cat_label,
    dept_id,
    dept_label,
    substate_label,
    state_id,
    state_label
  )
  SELECT 
    sls.fscldt_id,
    sls.pos_site_id,
    sls.sku_id,
    sls.price_substate_id,
    sls.isdiscounted,
    sls.sold_sales_units,
    sls.sold_sales_dollars,
    sls.sold_discount_dollars,
    sls.cancelled_sales_units,
    sls.cancelled_sales_dollars,
    sls.cancelled_discount_dollars,
    sls.returned_sales_units,
    sls.returned_sales_dollars,
    sls.returned_discount_dollars,
    mgn.sold_asc_margin_dollars,
    mgn.sold_alc_margin_dollars,
    mgn.cancelled_asc_margin_dollars,
    mgn.cancelled_alc_margin_dollars,
    mgn.returned_asc_margin_dollars,
    mgn.returned_alc_margin_dollars,
    sls.ly_sold_sales_units,
    sls.ly_sold_sales_dollars,
    sls.ly_sold_discount_dollars,
    sls.ly_cancelled_sales_units,
    sls.ly_cancelled_sales_dollars,
    sls.ly_cancelled_discount_dollars,
    sls.ly_returned_sales_units,
    sls.ly_returned_sales_dollars,
    sls.ly_returned_discount_dollars,
    mgn.ly_sold_asc_margin_dollars,
    mgn.ly_sold_alc_margin_dollars,
    mgn.ly_cancelled_asc_margin_dollars,
    mgn.ly_cancelled_alc_margin_dollars,
    mgn.ly_returned_asc_margin_dollars,
    mgn.ly_returned_alc_margin_dollars,
    sls.lly_sold_sales_units,
    sls.lly_sold_sales_dollars,
    sls.lly_sold_discount_dollars,
    sls.lly_cancelled_sales_units,
    sls.lly_cancelled_sales_dollars,
    sls.lly_cancelled_discount_dollars,
    sls.lly_returned_sales_units,
    sls.lly_returned_sales_dollars,
    sls.lly_returned_discount_dollars,
    mgn.lly_sold_asc_margin_dollars,
    mgn.lly_sold_alc_margin_dollars,
    mgn.lly_cancelled_asc_margin_dollars,
    mgn.lly_cancelled_alc_margin_dollars,
    mgn.lly_returned_asc_margin_dollars,
    mgn.lly_returned_alc_margin_dollars,
    _hcf_0_.fscldt_label,
    _hcf_0_.fsclwk_id,
    _hcf_0_.fsclwk_label,
    _hcf_0_.fsclmth_id,
    _hcf_0_.fsclmth_label,
    _hcf_0_.fsclqrtr_id,
    _hcf_0_.fsclqrtr_label,
    _hcf_0_.fsclyr_id,
    _hcf_0_.fsclyr_label,
    _hcf_0_.ssn_id,
    _hcf_0_.ssn_label,
    _hcf_0_.date,
    _hps_1_.site_label,
    _hps_1_.subchnl_id,
    _hps_1_.subchnl_label,
    _hps_1_.chnl_id,
    _hps_1_.chnl_label,
    _hps_2_.sku_label,
    _hps_2_.stylclr_id,
    _hps_2_.stylclr_label,
    _hps_2_.styl_id,
    _hps_2_.styl_label,
    _hps_2_.subcat_id,
    _hps_2_.subcat_label,
    _hps_2_.cat_id,
    _hps_2_.cat_label,
    _hps_2_.dept_id,
    _hps_2_.dept_label,
    _hps_3_.substate_label,
    _hps_3_.state_id,
    _hps_3_.state_label
  FROM
    cic_retail_bidw_data.view_sales_byday sls LEFT JOIN cic_retail_bidw_data.view_margin_byday mgn ON (mgn.fscldt_id = sls.fscldt_id AND mgn.pos_site_id = sls.pos_site_id AND mgn.sku_id = sls.sku_id AND mgn.price_substate_id = sls.price_substate_id AND mgn.isdiscounted = sls.isdiscounted)
      LEFT JOIN cic_retail_bidw_data.hier_clnd_fscldt _hcf_0_ ON (sls.fscldt_id = _hcf_0_.fscldt_id)
      LEFT JOIN cic_retail_bidw_data.hier_possite_site _hps_1_ ON (sls.pos_site_id = _hps_1_.site_id)
      LEFT JOIN cic_retail_bidw_data.hier_prod_sku _hps_2_ ON (sls.sku_id = _hps_2_.sku_id)
      LEFT JOIN cic_retail_bidw_data.hier_pricestate_substate _hps_3_ ON (sls.price_substate_id = _hps_3_.substate_id)
  ORDER BY
    sls.fscldt_id,
    sls.pos_site_id,
    sls.sku_id,
    sls.price_substate_id,
    sls.isdiscounted;


DELETE FROM cic_retail_bidw_data.view_salesandmargin_byday
  WHERE
    sold_sales_units IS NULL AND
    sold_sales_dollars IS NULL AND
    sold_discount_dollars IS NULL AND
    cancelled_sales_units IS NULL AND
    cancelled_sales_dollars IS NULL AND
    cancelled_discount_dollars IS NULL AND
    returned_sales_units IS NULL AND
    returned_sales_dollars IS NULL AND
    returned_discount_dollars IS NULL AND
    sold_asc_margin_dollars IS NULL AND
    sold_alc_margin_dollars IS NULL AND
    cancelled_asc_margin_dollars IS NULL AND
    cancelled_alc_margin_dollars IS NULL AND
    returned_asc_margin_dollars IS NULL AND
    returned_alc_margin_dollars IS NULL AND
    ly_sold_sales_units IS NULL AND
    ly_sold_sales_dollars IS NULL AND
    ly_sold_discount_dollars IS NULL AND
    ly_cancelled_sales_units IS NULL AND
    ly_cancelled_sales_dollars IS NULL AND
    ly_cancelled_discount_dollars IS NULL AND
    ly_returned_sales_units IS NULL AND
    ly_returned_sales_dollars IS NULL AND
    ly_returned_discount_dollars IS NULL AND
    ly_sold_asc_margin_dollars IS NULL AND
    ly_sold_alc_margin_dollars IS NULL AND
    ly_cancelled_asc_margin_dollars IS NULL AND
    ly_cancelled_alc_margin_dollars IS NULL AND
    ly_returned_asc_margin_dollars IS NULL AND
    ly_returned_alc_margin_dollars IS NULL AND
    lly_sold_sales_units IS NULL AND
    lly_sold_sales_dollars IS NULL AND
    lly_sold_discount_dollars IS NULL AND
    lly_cancelled_sales_units IS NULL AND
    lly_cancelled_sales_dollars IS NULL AND
    lly_cancelled_discount_dollars IS NULL AND
    lly_returned_sales_units IS NULL AND
    lly_returned_sales_dollars IS NULL AND
    lly_returned_discount_dollars IS NULL AND
    lly_sold_asc_margin_dollars IS NULL AND
    lly_sold_alc_margin_dollars IS NULL AND
    lly_cancelled_asc_margin_dollars IS NULL AND
    lly_cancelled_alc_margin_dollars IS NULL AND
    lly_returned_asc_margin_dollars IS NULL AND
    lly_returned_alc_margin_dollars IS NULL;

