# lhmg
Этот репозиторий содержит скрипт (и конфигурационный файл для docker-контейнера), устанавливающий и настраивающий рабочее окружение
для обработки результатов генотипирования и секвенирования. Скрипт устаналивает следующие программы:

1. [ADMIXTURE](http://www.genetics.ucla.edu/software/admixture/download.html)
2. [ALDER](http://groups.csail.mit.edu/cb/alder/)
3. [BWA](https://github.com/lh3/bwa)
4. [EIGENSOFT](https://www.hsph.harvard.edu/alkes-price/software/)
5. [qp3Pop from AdmixTools](https://github.com/DReichLab/AdmixTools) aka f3-statistics  
6. [Node.js](https://nodejs.org/en/)
7. [PLINK](https://www.cog-genomics.org/plink2)
8. [Redis](http://redis.io)

## Docker
Чтобы подготовить контейнер:
```
docker build -t lhmg .
```

Чтобы запустить контейнер:
```
docker run -v /localPathToYourData:/pathInContainerToYourData -it lhmg 
```