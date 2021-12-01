# SphinxDemoBase
База данных и конфигурация для демонстрации работы поискового движка Sphinx

### Настройка индексов и Sphinx сервисов:  
Создайте папки указанные в конфигурационных файлах.  
  
Ввести в терминале следующие команды для индексации базы данных:  
sudo indexer --all --rotate --config ./sphinx_usual.conf  
sudo indexer --all --rotate --config ./sphinx_express.conf  
sudo indexer --all --rotate --config ./sphinx_airexpress.conf  
sudo indexer --all --rotate --config ./sphinx.conf  
  
Ввести в терминале следующие команды для запуска Sphinx сервисов:  
sudo searchd -c {PATH_TO_GIT_DIR}/sphinx_usual.conf  
sudo searchd -c {PATH_TO_GIT_DIR}/sphinx_express.conf  
sudo searchd -c {PATH_TO_GIT_DIR}/sphinx_airexpress.conf  
sudo searchd -c {PATH_TO_GIT_DIR}/sphinx.conf  
