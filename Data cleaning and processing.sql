SELECT *
FROM (SELECT * FROM train_data AS t
LEFT JOIN (SELECT
    therapy_id as sath,
	SUM(CASE WHEN reversal_ind='N' THEN 1 ELSE 0 END) as non_reversal,
	SUM(CASE WHEN reversal_ind='Y' THEN 1 ELSE 0 END) as reversal,
	SUM(CASE WHEN generic_ind='BRANDED' THEN 1 ELSE 0 END) as branded,
	SUM(CASE WHEN generic_ind='GENERIC' THEN 1 ELSE 0 END) as general_med,
	SUM(CASE WHEN maint_ind='MAINT' THEN 1 else 0 END) as maint,
	SUM(CASE WHEN maint_ind='NONMAINT' THEN 1 else 0 END) as nonmaint,
    SUM(CASE WHEN pay_day_supply_cnt = 'null' THEN NULL ELSE CAST(pay_day_supply_cnt AS INT) END) AS Sum_pay_day_supply_cnt,
    AVG(CASE WHEN pay_day_supply_cnt = 'null' THEN NULL ELSE CAST(pay_day_supply_cnt AS FLOAT) END) AS Avg_pay_day_supply_cnt,
    SUM(CASE WHEN rx_cost = 'null' THEN NULL ELSE CAST(rx_cost AS NUMERIC) END) AS Sum_rx_cost,
    AVG(CASE WHEN rx_cost = 'null' THEN NULL ELSE CAST(rx_cost AS NUMERIC) END) AS Avg_rx_cost,
    SUM(CASE WHEN tot_drug_cost_accum_amt = 'null' THEN NULL ELSE CAST(tot_drug_cost_accum_amt AS NUMERIC) END) AS Sum_tot_drug_cost_accum_amt,
    AVG(CASE WHEN tot_drug_cost_accum_amt = 'null' THEN NULL ELSE CAST(tot_drug_cost_accum_amt AS NUMERIC) END) AS Avg_tot_drug_cost_accum_amt,
    SUM(CASE WHEN metric_strength = 'null' THEN NULL ELSE CAST(metric_strength AS NUMERIC) END) AS Sum_metric_strength,
    AVG(CASE WHEN metric_strength = 'null' THEN NULL ELSE CAST(metric_strength AS NUMERIC) END) AS Avg_metric_strength,
    SUM(CASE WHEN ddi_ind = 'null' THEN NULL ELSE CAST(ddi_ind AS INT) END) AS Sum_ddi_ind,
    AVG(CASE WHEN ddi_ind = 'null' THEN NULL ELSE CAST(ddi_ind AS FLOAT) END) AS Avg_ddi_ind,
    SUM(CASE WHEN anticoag_ind = 'null' THEN NULL ELSE CAST(anticoag_ind AS INT) END) AS Sum_anticoag_ind,
    AVG(CASE WHEN anticoag_ind = 'null' THEN NULL ELSE CAST(anticoag_ind AS FLOAT) END) AS Avg_anticoag_ind,
    SUM(CASE WHEN diarrhea_treat_ind = 'null' THEN NULL ELSE CAST(diarrhea_treat_ind AS INT) END) AS Sum_diarrhea_treat_ind,
    AVG(CASE WHEN diarrhea_treat_ind = 'null' THEN NULL ELSE CAST(diarrhea_treat_ind AS FLOAT) END) AS Avg_diarrhea_treat_ind,
    SUM(CASE WHEN nausea_treat_ind = 'null' THEN NULL ELSE CAST(nausea_treat_ind AS INT) END) AS Sum_nausea_treat_ind,
    AVG(CASE WHEN nausea_treat_ind = 'null' THEN NULL ELSE CAST(nausea_treat_ind AS FLOAT) END) AS Avg_nausea_treat_ind,
    SUM(CASE WHEN seizure_treat_ind = 'null' THEN NULL ELSE CAST(seizure_treat_ind AS INT) END) AS Sum_seizure_treat_ind,
    AVG(CASE WHEN seizure_treat_ind = 'null' THEN NULL ELSE CAST(seizure_treat_ind AS FLOAT) END) AS Avg_seizure_treat_ind
FROM rxclaim
GROUP BY therapy_id) as r
ON r.sath= t.therapy_id) as f 
LEFT JOIN (SELECT
    therapy_id as id_t,
    SUM(CASE WHEN ade_diagnosis = 'null' THEN NULL ELSE CAST(ade_diagnosis AS INT) END) AS Sum_ade_diagnosis,
    AVG(CASE WHEN ade_diagnosis = 'null' THEN NULL ELSE CAST(ade_diagnosis AS FLOAT) END) AS Avg_ade_diagnosis,
    SUM(CASE WHEN seizure_diagnosis = 'null' THEN NULL ELSE CAST(seizure_diagnosis AS INT) END) AS Sum_seizure_diagnosis,
    AVG(CASE WHEN seizure_diagnosis = 'null' THEN NULL ELSE CAST(seizure_diagnosis AS FLOAT) END) AS Avg_seizure_diagnosis,
    SUM(CASE WHEN pain_diagnosis = 'null' THEN NULL ELSE CAST(pain_diagnosis AS INT) END) AS Sum_pain_diagnosis,
    AVG(CASE WHEN pain_diagnosis = 'null' THEN NULL ELSE CAST(pain_diagnosis AS FLOAT) END) AS Avg_pain_diagnosis,  
    SUM(CASE WHEN fatigue_diagnosis = 'null' THEN NULL ELSE CAST(fatigue_diagnosis AS INT) END) AS Sum_fatigue_diagnosis,
    AVG(CASE WHEN fatigue_diagnosis = 'null' THEN NULL ELSE CAST(fatigue_diagnosis AS FLOAT) END) AS Avg_fatigue_diagnosis,   
    SUM(CASE WHEN nausea_diagnosis = 'null' THEN NULL ELSE CAST(nausea_diagnosis AS INT) END) AS Sum_nausea_diagnosis,
    AVG(CASE WHEN nausea_diagnosis = 'null' THEN NULL ELSE CAST(nausea_diagnosis AS FLOAT) END) AS Avg_nausea_diagnosis,
    SUM(CASE WHEN hyperglycemia_diagnosis = 'null' THEN NULL ELSE CAST(hyperglycemia_diagnosis AS INT) END) AS Sum_hyperglycemia_diagnosis,
    AVG(CASE WHEN hyperglycemia_diagnosis = 'null' THEN NULL ELSE CAST(hyperglycemia_diagnosis AS FLOAT) END) AS Avg_hyperglycemia_diagnosis,
    SUM(CASE WHEN constipation_diagnosis = 'null' THEN NULL ELSE CAST(constipation_diagnosis AS INT) END) AS Sum_constipation_diagnosis,
    AVG(CASE WHEN constipation_diagnosis = 'null' THEN NULL ELSE CAST(constipation_diagnosis AS FLOAT) END) AS Avg_constipation_diagnosis,    
    SUM(CASE WHEN diarrhea_diagnosis = 'null' THEN NULL ELSE CAST(diarrhea_diagnosis AS INT) END) AS Sum_diarrhea_diagnosis,
    AVG(CASE WHEN diarrhea_diagnosis = 'null' THEN NULL ELSE CAST(diarrhea_diagnosis AS FLOAT) END) AS Avg_diarrhea_diagnosis
FROM medclaim
GROUP BY therapy_id) AS s
ON s.id_t= f.therapy_id;
