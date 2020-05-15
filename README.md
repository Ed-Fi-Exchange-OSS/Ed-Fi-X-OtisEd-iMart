# OtisEd iMart Ed-Fi Data Warehouse Starter Kit

The OtisEd iMart Data Management solution for data warehousing is a layer of applications which  are built on Microsoft SQL Server.  The full solution allows for extension and customization of the data model to fit each client's business needs. The Starter kit provided here is a packaged version of the output from the full solution. It can be used as a starting point to build your own customized warehouse. For more information, or to schedule a demonstration of the full solution, please contact sales@otised.com.

This package uses the iMart/Ed-Fi Data Warehouse-Synergyz (1.0) model which specifies 28 tables (both dimensions and facts).  Included in this package are the 28 procedures (one per table) that transforms data stored in the Ed-Fi ODS version 3.1 structure to the conform table structures required for loading the data warehouse.  These 28 procedures will be referred to as the "*Ed-Fi ODS 3.1 Connector*". Additional scripts are included to create the database and load the transformed data into the corresponding transactional and analytical data models.  

## Getting Started

The instructions for installing are split into two sections. The first section details how to installing the iMart Data Warehouse database. The second section details how to transform and load the data from the Ed-Fi ODS 3.1 into the iMart Data Warehouse.

### Prerequisites

- Ed-Fi ODS 3.1
- SQL Server 2012 or later
- SSMS, latest version is recommended
- Disk space necessary for the iMart Data Warehouse (5GB-100GB, depending on volume of data)

Knowledge of how to create databases and administrator SQL Server environments is helpful. If you intend to manually customize the solution, a basic understanding of T-SQL will be necessary.

### SAID

A Submitting Agency ID or SAID for short is a specific identifier in our systems which is used to identify the source and type of data being submitted to our warehouse. We recommend using a 3-5 letter or character identify for the source (e.g. D010 or XYZ) and a 3-5 letter or character identifier for the source (e.g. EdFi3) separated by a dash. This value will need to be entered in a couple of places noted in the instructions before executing the scripts.


### Installing

Existing Zipline customers should contact support@otised.com or your account representative to obtain the Zipline package. If you are interested in a short presentation on the benefits and capabilities of Zipline, please contact us at sales@otised.com.

#### 0. Download NorthRidge Sample Database

a.  If you do not have an Ed-Fi database in your agency but want to test the iMartLoaders, you can do so by using the Northridge Sample Database.  Visit this site to download the Northridge database.  
b.  Change CurrentSchoolYear flag to 1 for '2018' SchoolYear and CurrentSchoolYear flag to 0 for '2015' in the SchoolYearType table in the NorthRidge database.  

#### 1. Create a database for the solution

```
In SSMS, create a new database named iMartEdFiDw or your name of choice
Recommended: database recovery mode should be set to simple
```

#### 2. Sourcing data from Ed-Fi

You will need to select either option a or option b below. You can start with 2a and then switch to 2b at a later time. Instructions for editing the scripts are in the scripts themselves.

##### 2a. Create views pointing to Ed-Fi ODS(Source) system
This option hits the source Ed-Fi ODS directly. It will have the freshest data. However, the performance can be slow and the impact on other workloads can be significant.

```
In SSMS, open the script Step2aCreateViews.sql
Edit the values of @SAID, @SourceDb and @SourceSvr based on the notes in the script
Execute the script in the database created in Step 1
```

##### 2b. Create Ed-Fi Raw Stage tables in iMart DW
This option stages the data into raw stage tables in the OtisEd iMart DW. This allows us to minimize the impact on the production Ed-Fi system and create additional indexes to enhance the performance of the transformation process.

```
In SSMS, open the script Step2bRawStage.sql
Edit the values of @SAID, @SourceDb and @SourceSvr based on the notes in the script
Execute the script in the database created in Step 1
```

#### 3. Create iMart Data Warehouse Tables and Procedures

```
In SSMS, expand Databases, right-click iMartEdFiDw and select New Query
Next, paste the contents of Step3CreateObjects.sql into the query window
Execute the script in the database created in Step 1
```

### Loading Data
Data loading is broken down into 3 steps.

#### 1. Transform data from Ed-Fi ODS format to iMart DW format

```
In SSMS, open the script Step4Transform.sql
Edit the @SAID variable to match what you selected in Step 2 of the Installing steps
Execute the script in the database created in Installing Step 1
```

#### 2. Load data from conformed format to transactional structures

```
In SSMS, open the script Step5LoadTDW.sql
Execute the script in the database created in Installing Step 1
```

#### 3. Load data from transactional structures to the analytical structures

```
In SSMS, open the script Step6LoadADW.sql
Execute the script in the database created in Installing Step 1
```


## Built With

* [iMart Synergyz](https://www.otised.com/synergyz) - Data Model / Data Dictionary Definitions
* [iMart Zipline](https://www.otised.com/zipline) - Database / Script generation based on model

## Contributing

Please contact support@otised.com and reference iMart Ed-Fi Data Warehouse Starter Kit in the subject of the email.

## Authors

* **Eddie Parker** - [OtisEd](https://www.otised.com)

See also the list of [contributors](https://github.com/Ed-Fi-Alliance/Ed-Fi-X-OtisEd-iMart/graphs/contributors) who participated in this project.

## License

This project is licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0.txt).

## Acknowledgments

* Delaware Department of Education
