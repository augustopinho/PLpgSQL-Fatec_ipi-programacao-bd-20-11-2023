-- Consulta para a média de dias de chuva por mês e localização
SELECT * FROM crosstab(
	'SELECT
		localidade,
		mes,
		ROUND(AVG(dias_chuva))
	FROM
		chuvas
	GROUP BY
		localidade, mes
	ORDER BY localidade, mes;'
) AS tabela_chuva_mes(
	"localidade" TEXT,
	"jan" NUMERIC,
	"fev" NUMERIC,
	"mar" NUMERIC,
	"abr" NUMERIC,
	"mai" NUMERIC,
	"jun" NUMERIC,
	"jul" NUMERIC,
	"ago" NUMERIC,
	"set" NUMERIC,
	"out" NUMERIC,
	"nov" NUMERIC,
	"dez" NUMERIC
);

-- Consulta para a soma de dias de chuva por ano e localização
SELECT * FROM crosstab(
	'SELECT
		localidade,
		ano,
		SUM(dias_chuva)
	FROM
		chuvas
	GROUP BY
		localidade, ano
	ORDER BY localidade, ano;'
) AS tabela_chuva_ano(
	"localidade" TEXT,
	"2018" BIGINT,
	"2019" BIGINT,
	"2020" BIGINT,
	"2021" BIGINT,
	"2022" BIGINT,
	"2023" BIGINT
);
