use hospital_bd;
 
 SELECT (sexo),count(sexo) FROM paciente 
GROUP BY sexo 
ORDER BY count(sexo) 
; 

SELECT COUNT(*) AS Quantidade_Pacientes
FROM Paciente;

SELECT 
    (SELECT COUNT(*) FROM Funcionario WHERE id_cargo = 1) AS Medicos,
    (SELECT COUNT(*) FROM Funcionario WHERE id_cargo = 2) AS Enfermeiros,
    (SELECT COUNT(*) FROM Funcionario WHERE id_cargo = 3) AS Estoquistas;
    
