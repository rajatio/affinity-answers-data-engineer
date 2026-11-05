
-- Question 1: Count distinct Acacia species

SELECT COUNT(DISTINCT species) AS acacia_types
FROM taxonomy
WHERE species LIKE '%Acacia%';


-- Question 2: Find the wheat type with the longest DNA sequence

SELECT
    tx.species,
    rf.rfamseq_acc,
    rf.length AS sequence_length
FROM rfamseq rf
JOIN taxonomy tx
    ON rf.ncbi_id = tx.ncbi_id
WHERE tx.species LIKE '%wheat%'
   OR tx.species LIKE '%Triticum%'
ORDER BY rf.length DESC
LIMIT 1;


-- Question 3: Get page 9 of families with maximum sequence length above 1,000,000

SELECT
    f.rfam_acc,
    f.rfam_id,
    MAX(r.length) AS max_length
FROM family f
JOIN full_region fr
    ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq r
    ON fr.rfamseq_acc = r.rfamseq_acc
WHERE fr.type = 'full'
  AND r.length > 1000000
GROUP BY f.rfam_acc, f.rfam_id
ORDER BY max_length DESC
LIMIT 15 OFFSET 120;
