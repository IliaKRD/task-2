CREATE TABLE Ilia.winemag (
    id UInt32,
    country String,
    description String,
    designation String,
    points UInt8,
    price Float32,
    province String,
    region_1 String,
    region_2 String,
    taster_name String,
    taster_twitter_handle String,
    title String,
    variety String,
    winery String
) ENGINE = MergeTree()
ORDER BY id;

SELECT COUNT(*) FROM Ilia.winemag; //проверял, что данные загружены


  // запрос выводит топ-10 стран с самыми дорогими винами.
  SELECT 
    country,
    MAX(price) AS max_price
FROM 
    Ilia.winemag
WHERE 
    country IS NOT NULL 
    AND price IS NOT NULL
GROUP BY 
    country
ORDER BY 
    max_price DESC
LIMIT 10;

//Корреляция между ценой и оценкой дегустатора
SELECT 
    country,
    region_1,
    AVG(price) AS avg_price,
    AVG(points) AS avg_points
FROM 
    Ilia.winemag
WHERE 
    country IS NOT NULL 
    AND price IS NOT NULL
    AND points IS NOT NULL
GROUP BY 
    country,
    region_1
ORDER BY 
    avg_price DESC;
