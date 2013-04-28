webapp
======

maven template

create archetype
-----------------
1. mvn archetype:create-from-project
2. cd target/generated-sources/archetype
3. Replace version="${version}"  with version="1.0" in all xml files under the src/main/resources/archetype-resources directory.
   1).spring config files; 2).persistence.xml; 3).web.xml;
4. mvn install


generate from archetype
-------------------
mvn archetype:generate -DarchetypeCatalog=local


delete
-------
1. ~/.m2/archetype-catalog.xml
2. ~/.m2/repository/archetype-catalog.xml (may exist or not)
3. ~/.m2/repository/<related package>
