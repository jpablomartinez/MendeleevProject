import '../Utils/Category.dart';

const List<Map> periodicTableElements = [
  {'symbol':'H','atomicNumber':1, 'name':'Hidrógeno' ,'category':C_NO_METALLIC,'atomicWeight':1.00797,'density':0.0709, 'atomicVol':14.2,'electronegativity':2.1,'tFusion':-259.2,'tBoiling':-252.7},
  {'symbol':'He','atomicNumber':2,'name':'Helio', 'category':C_NOBLE_GAS,'atomicWeight':4.0026,'density':0.126, 'atomicVol':31.77,'electronegativity':0,'tFusion':-269.7,'tBoiling':-268.9},
  {'symbol':'Li','atomicNumber':3,'name':'Litio','category':C_METALLIC,'atomicWeight':6.939,'density':0.535, 'atomicVol':12.97,'electronegativity':1,'tFusion':180.5,'tBoiling':1330},
  {'symbol':'Be','atomicNumber':4,'name':'Berilio', 'category':C_METALLIC,'atomicWeight':9.0122,'density':1.85, 'atomicVol':4.87,'electronegativity':1.5,'tFusion':1277,'tBoiling':2770},
  {'symbol':'B','atomicNumber':5,'name':'Boro','category':C_METALLOID,'atomicWeight':10.811,'density':2.31, 'atomicVol':4.68,'electronegativity':2.0,'tFusion':2250,'tBoiling':2550},
  {'symbol':'C','atomicNumber':6,'name':'Carbono','category':C_NO_METALLIC,'atomicWeight':12.0111,'density':2.26, 'atomicVol':5.31,'electronegativity':2.5,'tFusion':3727,'tBoiling':4830},
  {'symbol':'N','atomicNumber':7,'name':'Nitrógeno','category':C_NO_METALLIC,'atomicWeight':14.0069,'density':0.808, 'atomicVol':17.33,'electronegativity':3.0,'tFusion':-209.9,'tBoiling':-195.8},
  {'symbol':'O','atomicNumber':8,'name':'Oxígeno','category':C_NO_METALLIC,'atomicWeight':15.9994,'density':1.14, 'atomicVol':14.03,'electronegativity':3.5,'tFusion':-218.8,'tBoiling':-183},
  {'symbol':'F','atomicNumber':9,'name':'Fluor' ,'category': C_HALOGENS,'atomicWeight':18.9984,'density':1.11, 'atomicVol':17.11,'electronegativity':4.0,'tFusion':-219.6,'tBoiling':-188.2},
  {'symbol':'Ne','atomicNumber':10,'name':'Neon','category':C_NOBLE_GAS,'atomicWeight':20.183,'density':1.204, 'atomicVol':16.76,'electronegativity':0,'tFusion':-248.6,'tBoiling':-246},
  {'symbol':'Na','atomicNumber':11,'name':'Sodio','category':C_METALLIC,'atomicWeight':22.9898,'density':0.971, 'atomicVol':23.68,'electronegativity':0.9,'tFusion':97.8,'tBoiling':892},
  {'symbol':'Mg','atomicNumber':12,'name':'Magnesio','category':C_METALLIC,'atomicWeight':24.312,'density':1.74, 'atomicVol':13.97,'electronegativity':1.2,'tFusion':650,'tBoiling':1107},
  {'symbol':'Al','atomicNumber':13,'name':'Aluminio','category':C_METALLIC,'atomicWeight':26.9815,'density':2.70, 'atomicVol':9.99,'electronegativity':1.5,'tFusion':660,'tBoiling':2450},
  {'symbol':'Si','atomicNumber':14,'name':'Silicio','category':C_METALLOID,'atomicWeight':28.086,'density':2.33, 'atomicVol':12.05,'electronegativity':1.8,'tFusion':1410,'tBoiling':2680},
  {'symbol':'P','atomicNumber':15,'name':'Fósforo','category':C_NO_METALLIC,'atomicWeight':30.9738,'density':1.82, 'atomicVol':17.0,'electronegativity':2.1,'tFusion':44.2,'tBoiling':2870},
  {'symbol':'S','atomicNumber':16,'name':'Azufre','category':C_NO_METALLIC,'atomicWeight':32.064,'density':2.07, 'atomicVol':15.49,'electronegativity':2.5,'tFusion':112.8,'tBoiling':444.6},
  {'symbol':'Cl','atomicNumber':17,'name':'Cloro','category':C_HALOGENS,'atomicWeight':35.453,'density':1.56, 'atomicVol':18.7,'electronegativity':3.0,'tFusion':-101.0,'tBoiling':-34.7},
  {'symbol':'Ar','atomicNumber':18,'name':'Argón','category':C_NOBLE_GAS,'atomicWeight':39.948,'density':1.4, 'atomicVol':24.2,'electronegativity':0,'tFusion':-189.4,'tBoiling':-184.8},
  {'symbol':'K','atomicNumber':19,'name':'Potasio','category':C_METALLIC,'atomicWeight':39.102,'density':0.862, 'atomicVol':45.36,'electronegativity':0.8,'tFusion':63.7,'tBoiling':760},
  {'symbol':'Ca','atomicNumber':20,'name':'Calcio','category':C_METALLIC,'atomicWeight':40.08,'density':1.55, 'atomicVol':25.86,'electronegativity':1.0,'tFusion':838,'tBoiling':1440},
  {'symbol':'Sc','atomicNumber':21,'name':'Escandio','category':C_METALLIC,'atomicWeight':44.956,'density':2.99, 'atomicVol':15.0,'electronegativity':1.3,'tFusion':1539,'tBoiling':2730},
  {'symbol':'Ti','atomicNumber':22,'name':'Titanio','category':C_METALLIC,'atomicWeight':47.90,'density':4.51, 'atomicVol':10.62,'electronegativity':1.5,'tFusion':1668,'tBoiling':3260},
  {'symbol':'V','atomicNumber':23,'name':'Vanadio','category':C_METALLIC,'atomicWeight':50.942,'density':6.07, 'atomicVol':8.39,'electronegativity':1.6,'tFusion':1920,'tBoiling':3450},
  {'symbol':'Cr','atomicNumber':24,'name':'Cromo','category':C_METALLIC,'atomicWeight':51.996,'density':7.19, 'atomicVol':7.23,'electronegativity':1.6,'tFusion':1875,'tBoiling':2665},
  {'symbol':'Mn','atomicNumber':25,'name':'Manganeso','category':C_METALLIC,'atomicWeight':54.938,'density':7.43, 'atomicVol':7.39,'electronegativity':1.5,'tFusion':1245,'tBoiling':2150},
  {'symbol':'Fe','atomicNumber':26,'name':'Hierro','category':C_METALLIC,'atomicWeight':55.847,'density':7.87, 'atomicVol':7.1,'electronegativity':1.8,'tFusion':1536,'tBoiling':2740},
  {'symbol':'Co','atomicNumber':27,'name':'Cobalto','category':C_METALLIC,'atomicWeight':58.993,'density':8.9, 'atomicVol':6.62,'electronegativity':1.8,'tFusion':1453,'tBoiling':2900},
  {'symbol':'Ni','atomicNumber':28,'name':'Níquel','category':C_METALLIC,'atomicWeight':58.71,'density':8.90, 'atomicVol':6.62,'electronegativity':1.8,'tFusion':1083,'tBoiling':2730},
  {'symbol':'Cu','atomicNumber':29,'name':'Cobre','category':C_METALLIC,'atomicWeight':63.54,'density':8.96, 'atomicVol':7.1,'electronegativity':1.9,'tFusion':1083,'tBoiling':2595},
  {'symbol':'Zn','atomicNumber':30,'name':'Zinc','category':C_METALLIC,'atomicWeight':65.37,'density':7.14, 'atomicVol':9.16,'electronegativity':1.6,'tFusion':419.5,'tBoiling':906},
  {'symbol':'Ga','atomicNumber':31,'name':'Galio','category':C_METALLIC,'atomicWeight':69.72,'density':5.91, 'atomicVol':11.8,'electronegativity':1.6,'tFusion':29.8,'tBoiling':2237},
  {'symbol':'Ge','atomicNumber':32,'name':'Germanio','category':C_METALLOID,'atomicWeight':72.59,'density':5.36, 'atomicVol':13.5,'electronegativity':1.8,'tFusion':937.4,'tBoiling':2830},
  {'symbol':'As','atomicNumber':33,'name':'Arsénico','category':C_METALLOID,'atomicWeight':74.922,'density':5.72, 'atomicVol':13.1,'electronegativity':2.0,'tFusion':613,'tBoiling':817},
  {'symbol':'Se','atomicNumber':34,'name':'Selenio','category':C_NO_METALLIC,'atomicWeight':78.96,'density':4.79, 'atomicVol':16.48,'electronegativity':2.4,'tFusion':217,'tBoiling':685},
  {'symbol':'Br','atomicNumber':35,'name':'Bromo','category':C_HALOGENS,'atomicWeight':79.909,'density':3.12, 'atomicVol':23.5,'electronegativity':2.8,'tFusion':-7.2,'tBoiling':58.8},
  {'symbol':'Kr','atomicNumber':36,'name':'Kriptón','category':C_NOBLE_GAS,'atomicWeight':83.80,'density':2.6, 'atomicVol':32.2,'electronegativity':0,'tFusion':-157.3,'tBoiling':-152},
  {'symbol':'Rb','atomicNumber':37,'name':'Rubidio','category':C_METALLIC,'atomicWeight':85.47,'density':1.532, 'atomicVol':55.79,'electronegativity':0.8,'tFusion':38.9,'tBoiling':688},
  {'symbol':'Sr','atomicNumber':38,'name':'Estroncio','category':C_METALLIC,'atomicWeight':87.62,'density':2.6, 'atomicVol':33.7,'electronegativity':1.0,'tFusion':768,'tBoiling':1380},
  {'symbol':'Y','atomicNumber':39,'name':'Itrio','category':C_METALLIC,'atomicWeight':88.905,'density':4.48, 'atomicVol':19.89,'electronegativity':1.3,'tFusion':1509,'tBoiling':2927},
  {'symbol':'Zr','atomicNumber':40,'name':'Circonio','category':C_METALLIC,'atomicWeight':91.22,'density':6.49, 'atomicVol':14.06,'electronegativity':1.4,'tFusion':1852,'tBoiling':3580},
  {'symbol':'Nb','atomicNumber':41,'name':'Niobio','category':C_METALLIC,'atomicWeight':92.906,'density':8.57, 'atomicVol':10.84,'electronegativity':1.6,'tFusion':2420,'tBoiling':3300},
  {'symbol':'Mo','atomicNumber':42,'name':'Molibdeno','category':C_METALLIC,'atomicWeight':95.94,'density':10.22, 'atomicVol':9.39,'electronegativity':1.8,'tFusion':2620,'tBoiling':5560},
  {'symbol':'Tc','atomicNumber':43,'name':'Tecnecio','category':C_METALLIC,'atomicWeight':97,'density':11.5, 'atomicVol':8.4,'electronegativity':1.9,'tFusion':21.4,'tBoiling':0},
  {'symbol':'Ru','atomicNumber':44,'name':'Rutenio','category':C_METALLIC,'atomicWeight':101.07,'density':12.2, 'atomicVol':8.3,'electronegativity':2.2,'tFusion':2500,'tBoiling':4900},
  {'symbol':'Rh','atomicNumber':45,'name':'Rodio','category':C_METALLIC,'atomicWeight':102.905,'density':12.42, 'atomicVol':8.29,'electronegativity':2.2,'tFusion':1966,'tBoiling':4500},
  {'symbol':'Pd','atomicNumber':46,'name':'Paladio','category':C_METALLIC,'atomicWeight':106.42,'density':12.03, 'atomicVol':8.84,'electronegativity':2.2,'tFusion':1552,'tBoiling':3980},
  {'symbol':'Ag','atomicNumber':47,'name':'Plata','category':C_METALLIC,'atomicWeight':107.870,'density':10.50, 'atomicVol':10.3,'electronegativity':1.9,'tFusion':960.8,'tBoiling':2210},
  {'symbol':'Cd','atomicNumber':48,'name':'Cadmio','category':C_METALLIC,'atomicWeight':112.41,'density':8.64, 'atomicVol':13.0,'electronegativity':1.7,'tFusion':320.9,'tBoiling':765},
  {'symbol':'In','atomicNumber':49,'name':'Indio','category':C_METALLIC,'atomicWeight':114.82,'density':7.31, 'atomicVol':15.70,'electronegativity':1.7,'tFusion':156.2,'tBoiling':2070},
  {'symbol':'Sn','atomicNumber':50,'name':'Estaño','category':C_METALLIC,'atomicWeight':118.69,'density':7.31, 'atomicVol':16.2,'electronegativity':1.8,'tFusion':231.9,'tBoiling':2270},
  {'symbol':'Sb','atomicNumber':51,'name':'Antimonio','category':C_METALLOID,'atomicWeight':121.75,'density':6.62, 'atomicVol':18.4,'electronegativity':1.9,'tFusion':630.5,'tBoiling':1380},
  {'symbol':'Te','atomicNumber':52,'name':'Telurio','category':C_METALLOID,'atomicWeight':127.60,'density':6.24, 'atomicVol':20.4,'electronegativity':2.1,'tFusion':450,'tBoiling':1390},
  {'symbol':'I','atomicNumber':53,'name':'Yodo','category':C_HALOGENS,'atomicWeight':126.904,'density':4.94, 'atomicVol':25.7,'electronegativity':2.5,'tFusion':113.5,'tBoiling':184.3},
  {'symbol':'Xe','atomicNumber':54,'name':'Xenon','category':C_NOBLE_GAS,'atomicWeight':131.30,'density':3.06, 'atomicVol':42.9,'electronegativity':0,'tFusion':111.9,'tBoiling':-108},
  {'symbol':'Cs','atomicNumber':55,'name':'Cesio','category':C_METALLIC,'atomicWeight':132.905,'density': 1.90, 'atomicVol':69.95,'electronegativity':0.7,'tFusion':28.7,'tBoiling':690},
  {'symbol':'Ba','atomicNumber':56,'name':'Bario','category':C_METALLIC,'atomicWeight':137.33,'density':3.61, 'atomicVol':38.0,'electronegativity':0.9,'tFusion':714,'tBoiling':1640},
  {'symbol':'La','atomicNumber':57,'name':'Lantano','category':C_LANTHANIDE,'atomicWeight':138.91,'density':6.17, 'atomicVol':22.5,'electronegativity':1.1,'tFusion':920,'tBoiling':3470},
  {'symbol':'Ce','atomicNumber':58,'name':'Cerio','category':C_LANTHANIDE,'atomicWeight':140.12,'density':6.77, 'atomicVol':20.8,'electronegativity':1.1,'tFusion':795,'tBoiling':3468},
  {'symbol':'Pr','atomicNumber':59,'name':'Praseodimio','category':C_LANTHANIDE,'atomicWeight':140.907,'density':6.78, 'atomicVol':20.8,'electronegativity':1.1,'tFusion':935,'tBoiling':3127},
  {'symbol':'Nd','atomicNumber':60,'name':'Neodimio','category':C_LANTHANIDE,'atomicWeight':144.24,'density':7.0, 'atomicVol':20.6,'electronegativity':1.2,'tFusion':1024,'tBoiling':3027},
  {'symbol':'Pm','atomicNumber':61,'name':'Prometio','category':C_LANTHANIDE,'atomicWeight':145,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':1027,'tBoiling':0},
  {'symbol':'Sm','atomicNumber':62,'name':'Samario','category':C_LANTHANIDE,'atomicWeight':150.36,'density':7.54, 'atomicVol':19.9,'electronegativity':1.2,'tFusion':1072,'tBoiling':1900},
  {'symbol':'Eu','atomicNumber':63,'name':'Europio','category':C_LANTHANIDE,'atomicWeight':151.96,'density':5.26, 'atomicVol':28.9,'electronegativity':0,'tFusion':826,'tBoiling':1439},
  {'symbol':'Gd','atomicNumber':64,'name':'Gadolinio','category':C_LANTHANIDE,'atomicWeight':157.25,'density':7.89, 'atomicVol':19.9,'electronegativity':1.1,'tFusion':1312,'tBoiling':3000},
  {'symbol':'Tb','atomicNumber':65,'name':'Terbio','category':C_LANTHANIDE,'atomicWeight':158.924,'density':8.27, 'atomicVol':19.2,'electronegativity':1.2,'tFusion':1356,'tBoiling':2800},
  {'symbol':'Dy','atomicNumber':66,'name':'Disprosio','category':C_LANTHANIDE,'atomicWeight':162.50,'density':8.54, 'atomicVol':19.0,'electronegativity':0,'tFusion':1407,'tBoiling':2600},
  {'symbol':'Ho','atomicNumber':67,'name':'Holmio','category':C_LANTHANIDE,'atomicWeight':164.930,'density':8.80, 'atomicVol':18.7,'electronegativity':1.2,'tFusion':1461,'tBoiling':2600},
  {'symbol':'Er','atomicNumber':68,'name':'Erbio','category':C_LANTHANIDE,'atomicWeight':167.26,'density':9.05, 'atomicVol':18.5,'electronegativity':1.2,'tFusion':1497,'tBoiling':2900},
  {'symbol':'Tm','atomicNumber':69,'name':'Tulio','category':C_LANTHANIDE,'atomicWeight':168.934,'density':9.33, 'atomicVol':18.1,'electronegativity':1.2,'tFusion':1545,'tBoiling':1727},
  {'symbol':'Yb','atomicNumber':70,'name':'Iterbio','category':C_LANTHANIDE,'atomicWeight':173.04,'density':6.98, 'atomicVol':24.8,'electronegativity':1.1,'tFusion':824,'tBoiling':1427},
  {'symbol':'Lu','atomicNumber':71,'name':'Lutecio','category':C_LANTHANIDE,'atomicWeight':174.97,'density':9.84, 'atomicVol':17.8,'electronegativity':1.2,'tFusion':1652,'tBoiling':3327},
  {'symbol':'Hf','atomicNumber':72,'name':'Hafnio','category':C_METALLIC,'atomicWeight':178.49,'density':13.1, 'atomicVol':13.6,'electronegativity':1.3,'tFusion':2220,'tBoiling':5400},
  {'symbol':'Ta','atomicNumber':73,'name':'Tantalio','category':C_METALLIC,'atomicWeight':180.948,'density':16.6, 'atomicVol':10.9,'electronegativity':1.5,'tFusion':2996,'tBoiling':5400},
  {'symbol':'W','atomicNumber':74,'name':'Wolframio','category':C_METALLIC,'atomicWeight':183.85,'density':19.26, 'atomicVol':9.54,'electronegativity':1.7,'tFusion':3380,'tBoiling':5900},
  {'symbol':'Re','atomicNumber':75,'name':'Renio','category':C_METALLIC,'atomicWeight':186.2,'density':21.0, 'atomicVol':8.87,'electronegativity':1.9,'tFusion':3170,'tBoiling':5900},
  {'symbol':'Os','atomicNumber':76,'name':'Osmio','category':C_METALLIC,'atomicWeight':190.207,'density':22.7, 'atomicVol':8.38,'electronegativity':1.2,'tFusion':2700,'tBoiling':5500},
  {'symbol':'Ir','atomicNumber':77,'name':'Iridio','category':C_METALLIC,'atomicWeight':192.2,'density':22.64, 'atomicVol':8.49,'electronegativity':2.2,'tFusion':2454,'tBoiling':5300},
  {'symbol':'Pt','atomicNumber':78,'name':'Platino','category':C_METALLIC,'atomicWeight':195.09,'density':21.45, 'atomicVol':9.09,'electronegativity':2.2,'tFusion':1769,'tBoiling':4530},
  {'symbol':'Au','atomicNumber':79,'name':'Oro','category':C_METALLIC,'atomicWeight':196.967,'density':19.3, 'atomicVol':10.2,'electronegativity':2.4,'tFusion':1063,'tBoiling':2970},
  {'symbol':'Hg','atomicNumber':80,'name':'Mercurio','category':C_METALLIC,'atomicWeight':200.59,'density':13.59, 'atomicVol':14.8,'electronegativity':1.9,'tFusion':-38.4,'tBoiling':357},
  {'symbol':'TI','atomicNumber':81,'name':'Talio','category':C_METALLIC,'atomicWeight':204.383,'density':11.85, 'atomicVol':17.2,'electronegativity':1.8,'tFusion':303,'tBoiling':1457},
  {'symbol':'Pb','atomicNumber':82,'name':'Plomo','category':C_METALLIC,'atomicWeight':207.19,'density':11.34, 'atomicVol':18.3,'electronegativity':1.8,'tFusion':327.4,'tBoiling':1725},
  {'symbol':'Bi','atomicNumber':83,'name':'Bismuto','category':C_METALLIC,'atomicWeight':208.980,'density':9.8, 'atomicVol':21.3,'electronegativity':1.9,'tFusion':271.3,'tBoiling':1560},
  {'symbol':'Po','atomicNumber':84,'name':'Polonio','category':C_METALLOID,'atomicWeight':210,'density':0, 'atomicVol':0,'electronegativity':2.0,'tFusion':254,'tBoiling':0},
  {'symbol':'At','atomicNumber':85,'name':'Astato','category':C_HALOGENS,'atomicWeight':210,'density':0, 'atomicVol':0,'electronegativity':2.2,'tFusion':302,'tBoiling':0},
  {'symbol':'Rn','atomicNumber':86,'name':'Radon','category':C_NOBLE_GAS,'atomicWeight':222,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':-71,'tBoiling':-61.8},
  {'symbol':'Fr','atomicNumber':87,'name':'Francio','category':C_METALLIC,'atomicWeight':223,'density':0, 'atomicVol':0,'electronegativity':0.7,'tFusion':27,'tBoiling':0},
  {'symbol':'Ra','atomicNumber':88,'name':'Radio','category':C_METALLIC,'atomicWeight':226,'density':5.0, 'atomicVol':45.2,'electronegativity':0.9,'tFusion':700,'tBoiling':0},
  {'symbol':'Ac','atomicNumber':89,'name':'Actinio','category':C_ACTINIDES,'atomicWeight':227,'density':0, 'atomicVol':0,'electronegativity':1.1,'tFusion':1050,'tBoiling':0},
  {'symbol':'Th','atomicNumber':90,'name':'Torio','category':C_ACTINIDES,'atomicWeight':232.038,'density':11.7, 'atomicVol':19.8,'electronegativity':1.3,'tFusion':1750,'tBoiling':3850},
  {'symbol':'Pa','atomicNumber':91,'name':'Protactinio','category':C_ACTINIDES,'atomicWeight':231,'density':15.4, 'atomicVol':15.0,'electronegativity':1.5,'tFusion':1230,'tBoiling':0},
  {'symbol':'U','atomicNumber':92,'name':'Uranio','category':C_ACTINIDES,'atomicWeight':283.03,'density':19.05, 'atomicVol':12.5,'electronegativity':1.7,'tFusion':1132,'tBoiling':3818},
  {'symbol':'Np','atomicNumber':93,'name':'Neptunio','category':C_ACTINIDES,'atomicWeight':237,'density':19.5, 'atomicVol':12.1,'electronegativity':1.3,'tFusion':837,'tBoiling':0},
  {'symbol':'Pu','atomicNumber':94,'name':'Plutonio','category':C_ACTINIDES,'atomicWeight':244,'density':19.7, 'atomicVol':12.3,'electronegativity':1.3,'tFusion':640,'tBoiling':3235},
  {'symbol':'Am','atomicNumber':95,'name':'Americio','category':C_ACTINIDES,'atomicWeight':243,'density':11.7, 'atomicVol':20.8,'electronegativity':1.3,'tFusion':0,'tBoiling':0},
  {'symbol':'Cm','atomicNumber':96,'name':'Curio','category':C_ACTINIDES,'atomicWeight':247,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Bk','atomicNumber':97,'name':'Berkelio','category':C_ACTINIDES,'atomicWeight':247,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Cf','atomicNumber':98,'name':'Californio','category':C_ACTINIDES,'atomicWeight':251,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Es','atomicNumber':99,'name':'Einstenio','category':C_ACTINIDES,'atomicWeight':252,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Fm','atomicNumber':100,'name':'Fermio','category':C_ACTINIDES,'atomicWeight':257,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Md','atomicNumber':101,'name':'Mendelevio','category':C_ACTINIDES,'atomicWeight':258,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'No','atomicNumber':102,'name':'Nobelio','category':C_ACTINIDES,'atomicWeight':259,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Lr','atomicNumber':103,'name':'Lawrencio','category':C_ACTINIDES,'atomicWeight':262,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Rf','atomicNumber':104,'name':'Rutherfordio','category':C_METALLIC,'atomicWeight':261,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Db','atomicNumber':105,'name':'Dubnio','category':C_METALLIC,'atomicWeight':262,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Sg','atomicNumber':106,'name':'Seaborgio','category':C_METALLIC,'atomicWeight':263,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Bh','atomicNumber':107,'name':'Bohrio','category':C_METALLIC,'atomicWeight':262,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Hs','atomicNumber':108,'name':'Hassio','category':C_METALLIC,'atomicWeight':265,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Mt','atomicNumber':109,'name':'Meitnerio','category':C_METALLIC,'atomicWeight':266,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Ds','atomicNumber':110,'name':'Darmstadio','category':C_METALLIC,'atomicWeight':281,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Rg','atomicNumber':111,'name':'Roentgenio','category':C_METALLIC,'atomicWeight':272,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Cn','atomicNumber':112,'name':'Copernicio','category':C_METALLIC,'atomicWeight':285,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Nh','atomicNumber':113,'name':'Nihonio','category':C_METALLIC,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'FI','atomicNumber':114,'name':'Flerovio','category':C_METALLIC,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Mc','atomicNumber':115,'name':'Moscovio','category':C_METALLIC,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Lv','atomicNumber':116,'name':'Livermorio','category':C_METALLIC,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Ts','atomicNumber':117,'name':'Teneso','category':C_HALOGENS,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
  {'symbol':'Og','atomicNumber':118,'name':'Oganeson','category':C_NOBLE_GAS,'atomicWeight':0,'density':0, 'atomicVol':0,'electronegativity':0,'tFusion':0,'tBoiling':0},
];
