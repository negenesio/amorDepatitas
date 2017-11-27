import amordepatitas.Ciudad
import amordepatitas.Postulacion
import amordepatitas.Raza
import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole
import amordepatitas.Mascota

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
        def mascotaRole = SecRole.findByAuthority('ROLE_MASCOTA') ?: new SecRole(authority: 'ROLE_MASCOTA').save(failOnError: true)
        def rolePostulacion = SecRole.findByAuthority('ROLE_POSTULACION') ?: new SecRole(authority: 'ROLE_POSTULACION').save(failOnError: true)
        def roleEncuentro = SecRole.findByAuthority('ROLE_ENCUENTRO') ?: new SecRole(authority: 'ROLE_ENCUENTRO').save(failOnError: true)
        def roleCalificacion = SecRole.findByAuthority('ROLE_CALIFICACION') ?: new SecRole(authority: 'ROLE_CALIFICACION').save(failOnError: true)
        def roleEncuentroAprobado = SecRole.findByAuthority('ROLE_ENCUENTRO_APROBADO') ?: new SecRole(authority: 'ROLE_ENCUENTRO_APROBADO').save(failOnError: true)
        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                name: 'admin',
                email: 'nicolas.gnesio@mercadolibre.com',
                dateBirth: new Date(),
                password: 'admin',
                sexo: 'masculino',
                enabled: true).save(failOnError: true)

        def user = SecUser.findByUsername('nico') ?: new SecUser(
                username: 'nico',
                name: 'nico',
                email: 'nicolas.gnesio@gmail.com',
                dateBirth: new Date(),
                password: 'nico',
                sexo: 'masculino',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create(adminUser, adminRole)
        }

        if (!user.authorities.contains(userRole)) {
            SecUserSecRole.create(user, userRole)
        }

        def razas = ["Affenpinscher", "Airedale Terrier", "Akita","Akita americano","Alaskan Husky","Alaskan Malamute",
                     "American Foxhound", "American pit bull terrier", "American staffordshire terrier", "Ariegeois",
                     "Artois", "Australian silky terrier", "Australian terrier", "Austrian Black & Tan Hound",
                     "Azawakh", "Balkan Hound", "Basenji", "Basset Alpino", "Basset Artesiano Normando",
                     "Basset Azul de Gascuña", "Basset de Artois", "Basset de Westphalie", "Basset Hound",
                     "Basset Leonado de Bretaña", "Bavarian Mountain Scenthound", "Beagle", "Beagle Harrier",
                     "Beauceron", "Bedlington Terrier", "Bichon Boloñes", "Bichón Frisé", "Bichón Habanero", "Billy",
                     "Black and Tan Coonhound", "Bloodhound","Bobtail", "Boerboel", "Border Collie", "Border Terrier",
                     "Borzoi", "Bosnian Hound", "Boston terrier", "Bouvier des Flandres", "Boxer",
                     "Boyero de Appenzell", "Boyero de Australia","Boyero de Entlebuch", "Boyero de Montaña Bernes",
                     "Braco Alemán de pelo corto", "Braco Alemán de pelo duro", "Braco de Ariege", "Braco de Auvernia",
                     "Braco de Bourbonnais", "Braco de Saint Germain", "Braco Dupuy", "Braco Francés", "Braco Italiano",
                     "Broholmer", "Buhund Noruego", "Bull terrier", "Bulldog", "Bulldog americano", "Bulldog Francés",
                     "Bullmastiff", "Ca de Bestiar", "Cairn terrier", "Cane Corso",
                     "Cane da Pastore Maremmano-Abruzzese", "Caniche", "Caniche Toy","Cao da Serra de Estrela",
                     "Cao de Castro Laboreiro", "Cao de Fila de Sao Miguel", "Cao de Serra de Aires",
                     "Cardigan Welsh Corgi", "Cavalier King Charles Spaniel", "Cesky Fousek", "Ceský teriér",
                     "Chesapeake Bay Retriever", "Chihuahua", "Chin", "Chow Chow", "Cirneco del Etna",
                     "Clumber Spaniel", "Cocker Spaniel Americano", "Cocker Spaniel Inglés", "Collie Barbudo",
                     "Collie de Pelo Corto","Collie de Pelo Largo","Cotón de Tuléar", "Curly Coated Retriever",
                     "Dálmata", "Dandie dinmont terrier", "Deerhound", "Dobermann","Dogo Argentino","Dogo de Burdeos",
                     "Dogo del Tibet","Drentse Partridge Dog","Drever","Dunker","Elkhound Noruego","Elkhound Sueco",
                     "English Foxhound","English Springer Spaniel","English toy terrier","Epagneul Picard","Eurasier",
                     "Fila Brasileiro", "Finnish Lapphound", "Flat Coated Retriever", "Fox terrier de pelo de alambre",
                     "Fox terrier de pelo liso","Foxhound Inglés","Frisian Pointer","Galgo Español","Galgo húngaro",
                     "Galgo Italiano","Galgo Polaco","Glen of Imaal Terrier", "Golden Retriever", "Gordon Setter",
                     "Gos d'Atura Catalá","Gran Basset Griffon Vendeano","Gran Boyero Suizo","Gran Danés",
                     "Gran Gascón Saintongeois","Gran Griffon Vendeano","Gran Munsterlander","Gran Perro Japonés",
                     "Grand Anglo Francais Tricoleur","Grand Bleu de Gascogne","Greyhound","Griffon Bleu de Gascogne",
                     "Griffon de pelo duro","Griffon leonado de Bretaña","Griffon Nivernais","Grifon Belga",
                     "Grifón de Bruselas","Haldenstoever","Harrier","Hokkaido","Hovawart","Husky Siberiano",
                     "Ioujnorousskaia Ovtcharka","Irish Glen of Imaal terrier","Irish soft coated wheaten terrier",
                     "Irish terrier","Irish Water Spaniel","Irish Wolfhound","Jack Russell terrier","Jindo Coreano",
                     "Kai","Keeshond","Kelpie Australiano Australian Kelpie)","Kerry blue terrier",
                     "King Charles Spaniel","Kishu","Komondor", "Kooiker","Kromfohrländer","Kuvasz",
                     "Labrador Retriever","Lagotto Romagnolo","Laika de Siberia Occidental","Laika de Siberia Oriental",
                     "Laika Ruso Europeo","Lakeland terrier","Landseer","Lapphund Sueco","Lebrel Afgano","Lebrel Arabe",
                     "Leonberger","Lhasa Apso","Lowchen","Lundehund Noruego","Malamute de Alaska","Maltés",
                     "Manchester terrier","Mastiff","Mastín de los Pirineos","Mastín Español","Mastín Napolitano",
                     "Mudi","Norfolk terrier","Norwich terrier","Nova Scotia duck tolling retriever","Ovejero alemán",
                     "Otterhound","Papillón","Parson Russell terrier","Pastor Alemán","Pastor Australiano",
                     "Pastor Belga","Pastor Belga Groenendael","Pastor Belga Laekenois","Pastor Belga Malinois",
                     "Pastor Belga Tervueren","Pastor Bergamasco","Pastor Blanco Suizo","Pastor Croata",
                     "Pastor de Anatolia","Pastor de Asia Central","Pastor de Brie","Pastor de Istria",
                     "Pastor de Laponia","Pastor de los Pirineos","Pastor de Shetland","Pastor del Atlas",
                     "Pastor del Cáucaso","Pastor Holandés","Pastor Islandés","Pastor Picard","Pastor Vasco","Pekinés",
                     "Pembroke Welsh Corgi","Pequeño Munsterlander","Perdiguero de Burgos","Perdiguero Portugués",
                     "Perro Crestado Chino","Perro de Agua Americano","Perro de Agua Español","Perro de Agua Francés",
                     "Perro de Agua Frisón", "Perro de Agua Portugués", "Perro de Canaan","Perro de Groenlandia",
                     "Perro de los Visigodos","Perro de Montaña de los Pirineos","Perro de Osos de Carelia",
                     "Perro de Presa Español","Perro de Presa Mallorquín","Perro del Faraón","Perro Esquimal Americano",
                     "Perro Esquimal Canadiense","Perro Lobo Checoslovaco","Perro sin pelo de Perú",
                     "Petit Basset Griffon Vendeen","Petit Blue de Gascogne","Petit Brabancon","Pinscher",
                     "Pinscher austríaco de pelo corto","Pinscher Miniatura","Pit bull terrier americano",
                     "Podenco Andaluz","Podenco Canario","Podenco Ibicenco","Podenco Portugués","Pointer","Poitevin",
                     "Polish Lowland Sheepdog","Polish Tatra Mountain Dog","Pomerania","Porcelana","Presa Canario",
                     "Pug","Puli","Pumi","Rafeiro do Alentejo","Ratonero Bodeguero Andaluz",
                     "Retriever de Nueva Escocia","Rhodesian Ridgeback","Ridgeback de Tailandia", "Rottweiler",
                     "Saarloos Wolfdog","Sabueso de Hamilton", "Sabueso de Hannover","Sabueso de Hygen",
                     "Sabueso de Istria","Sabueso de Posavaz","Sabueso de Schiller","Sabueso de Smaland",
                     "Sabueso de Transilvania","Sabueso del Tirol","Sabueso Español","Sabueso Estirio de pelo duro",
                     "Sabueso Finlandés","Sabueso Francés blanco y negro","Sabueso Francés tricolor","Sabueso Griego",
                     "Sabueso Polaco","Sabueso Serbio","Sabueso Suizo","Sabueso Yugoslavo de Montaña",
                     "Sabueso Yugoslavo tricolor","Saluki","Samoyedo","San Bernardo","Sarplaninac","Schapendoes",
                     "Schipperke","Schnauzer estándar","Schnauzer gigante","Schnauzer miniatura","Scottish terrier",
                     "Sealyham terrier","Segugio Italiano","Seppala Siberiano","Setter Inglés","Setter Irlandés",
                     "Setter Irlandés rojo y blanco","Shar Pei","Shiba Inu","Shih Tzu","Shikoku","Skye terrier",
                     "Slovensky Cuvac", "Slovensky Kopov","Smoushond Holandés", "Spaniel Alemán",
                     "Spaniel Azul de Picardía","Spaniel Bretón","Spaniel de Campo","Spaniel de Pont Audemer",
                     "Spaniel Francés","Spaniel Tibetano","Spinone Italiano","Spítz Alemán","Spitz de Norbotten",
                     "Spitz Finlandés","Spitz Japonés","Staffordshire bull terrier","Staffordshire terrier americano",
                     "Sussex Spaniel","Teckel","Terranova","Terrier australiano","Terrier brasilero","Terrier cazador alemán",
                     "Terrier checo","Terrier galés","Terrier irlandés","Terrier japonés","Terrier negro ruso",
                     "Terrier tibetano","Tosa","Viejo Pastor Inglés","Viejo Pointer Danés","Vizsla","Volpino Italiano",
                     "Weimaraner","Welsh springer spaniel","Welsh terrier","West highland white terrier","Whippet",
                     "Wirehaired solvakian pointer","Xoloitzcuintle","Yorkshire terrier"]
        razas.each {
            new Raza(descripcion: it).save(failOnError: true)
        }

        new Mascota(nombre: 'KERO', raza: Raza.findByDescripcion('Schnauzer miniatura'), fechaNacimiento: Date.parse('YYY-mm-dd', '2015-11-04'), secUser: SecUser.findByUsername('ADMIN'),
                fechaCreacion: new Date(), sexo: 'MACHO').save(failOnError: true)

        new Mascota(nombre: 'RUPERTO', raza: Raza.findByDescripcion('Schnauzer estándar'), fechaNacimiento:
                Date.parse('YYY-mm-dd', '2010-08-22'), secUser: SecUser.findByUsername('ADMIN'),
                fechaCreacion: new Date(), sexo: 'MACHO').save(failOnError: true)

        new Postulacion(user: SecUser.findByUsername('ADMIN'), mascota: Mascota.findById(1),
                desde: Date.parse('HH:mm', '10:00'), hasta:  Date.parse('HH:mm', '18:00'),
                dias: 'LUNES,MARTES,MIERCOLES,JUEVES,VIERNES',
                observaciones: 'Ruperto es un macho aplpha de excelente cualidades').save(failOnError: true)

        new Postulacion(user: SecUser.findByUsername('ADMIN'), mascota: Mascota.findById(2),
                desde: Date.parse('HH:mm', '15:00'), hasta:  Date.parse('HH:mm', '22:00'),
                dias: 'SABADO,DOMINGO', observaciones: 'Kero es muy jugueton y alegre').save(failOnError: true)
        Mascota mascota = Mascota.findById(1)
        mascota.postulado = true
        mascota.save(failOnError: true)

        mascota = Mascota.findById(2)
        mascota.postulado = true
        mascota.save(failOnError: true)

        SecUserSecRole.create(adminUser, mascotaRole)
        SecUserSecRole.create(adminUser, rolePostulacion)

        new Mascota(nombre: 'PEPE', raza: Raza.findByDescripcion('Schnauzer miniatura'), fechaNacimiento: Date.parse('YYY-mm-dd', '2015-11-04'), secUser: SecUser.findByUsername('nico'),
                fechaCreacion: new Date(), sexo: 'MACHO').save(failOnError: true)
        new Mascota(nombre: 'PEPA', raza: Raza.findByDescripcion('Schnauzer miniatura'), fechaNacimiento: Date.parse('YYY-mm-dd', '2015-11-04'), secUser: SecUser.findByUsername('nico'),
                fechaCreacion: new Date(), sexo: 'HEMBRA').save(failOnError: true)
        new Mascota(nombre: 'JUANCHO', raza: Raza.findByDescripcion('Parson Russell terrier'), fechaNacimiento: Date.parse('YYY-mm-dd', '2015-11-04'), secUser: SecUser.findByUsername('nico'),
                fechaCreacion: new Date(), sexo: 'HEMBRA').save(failOnError: true)

        SecUserSecRole.create(user, mascotaRole)

        def ciudades = [[ "name": "Achiras"], [ "name": "Adelia Maria"], [ "name": "Agua de Oro"], [ "name": "Alcira Gigena"],
                        [ "name": "Aldea Santa Maria"], [ "name": "Alejandro Roca"], [ "name": "Alejo Ledesma"],
                        [ "name": "Alicia"], [ "name": "Almafuerte"], [ "name": "Alpa Corral"], [ "name": "Alta Gracia"],
                        [ "name": "Alto Alegre"], [ "name": "Alto de Los Quebrachos"], [ "name": "Altos de Chipion"],
                        [ "name": "Amboy"], [ "name": "Ambul"], [ "name": "Ana Zumaran"], [ "name": "Anisacate"],
                        [ "name": "Arguello"], [ "name": "Arias"], [ "name": "Arroyito"], [ "name": "Arroyo Algodon"],
                        [ "name": "Arroyo Cabral"], [ "name": "Arroyo Los Patos"], [ "name": "Assunta"], [ "name": "Atahona"],
                        [ "name": "Ausonia"], [ "name": "Avellaneda"], [ "name": "Ballesteros"], [ "name": "Ballesteros Sud"],
                        [ "name": "Balnearia"], [ "name": "Bañado de Soto"], [ "name": "Bell Ville"], [ "name": "Bengolea"],
                        [ "name": "Benjamin Gould"], [ "name": "Berrotaran"], [ "name": "Bialet Masse"], [ "name": "Bouwer"],
                        [ "name": "Brinkmann"], [ "name": "Buchardo"], [ "name": "Bulnes"], [ "name": "Cabalango"],
                        [ "name": "Calamuchita"], [ "name": "Calchin"], [ "name": "Calchin Oeste"], [ "name": "Calmayo"],
                        [ "name": "Camilo Aldao"], [ "name": "Caminiaga"], [ "name": "Cañada de Luque"],
                        [ "name": "Cañada de Machado"], [ "name": "Cañada de Rio Pinto"], [ "name": "Cañada del Sauce"],
                        [ "name": "Canals"], [ "name": "Candelaria Sud"], [ "name": "Capilla de Remedios"],
                        [ "name": "Capilla de Siton"], [ "name": "Capilla del Carmen"], [ "name": "Capilla del Monte"],
                        [ "name": "Capital"], [ "name": "Capitan Gral B. O´Higgins"], [ "name": "Carnerillo"],
                        [ "name": "Carrilobo"], [ "name": "Casa Grande"], [ "name": "Cavanagh"], [ "name": "Cerro Colorado"],
                        [ "name": "Chaján"], [ "name": "Chalacea"], [ "name": "Chañar Viejo"], [ "name": "Chancaní"],
                        [ "name": "Charbonier"], [ "name": "Charras"], [ "name": "Chazón"], [ "name": "Chilibroste"],
                        [ "name": "Chucul"], [ "name": "Chuña"], [ "name": "Chuña Huasi"], [ "name": "Churqui Cañada"],
                        [ "name": "Cienaga Del Coro"], [ "name": "Cintra"], [ "name": "Col. Almada"], [ "name": "Col. Anita"],
                        [ "name": "Col. Barge"], [ "name": "Col. Bismark"], [ "name": "Col. Bremen"], [ "name": "Col. Caroya"],
                        [ "name": "Col. Italiana"], [ "name": "Col. Iturraspe"], [ "name": "Col. Las Cuatro Esquinas"],
                        [ "name": "Col. Las Pichanas"], [ "name": "Col. Marina"], [ "name": "Col. Prosperidad"],
                        [ "name": "Col. San Bartolome"], [ "name": "Col. San Pedro"], [ "name": "Col. Tirolesa"],
                        [ "name": "Col. Vicente Aguero"], [ "name": "Col. Videla"], [ "name": "Col. Vignaud"],
                        [ "name": "Col. Waltelina"], [ "name": "Colazo"], [ "name": "Comechingones"], [ "name": "Conlara"],
                        [ "name": "Copacabana"], [ "name": "7"], [ "name": "Coronel Baigorria"], [ "name": "Coronel Moldes"],
                        [ "name": "Corral de Bustos"], [ "name": "Corralito"], [ "name": "Cosquín"], [ "name": "Costa Sacate"],
                        [ "name": "Cruz Alta"], [ "name": "Cruz de Caña"], [ "name": "Cruz del Eje"], [ "name": "Cuesta Blanca"],
                        [ "name": "Dean Funes"], [ "name": "Del Campillo"], [ "name": "Despeñaderos"],
                        [ "name": "Devoto"], [ "name": "Diego de Rojas"], [ "name": "Dique Chico"], [ "name": "El Arañado"],
                        [ "name": "El Brete"], [ "name": "El Chacho"], [ "name": "El Crispín"], [ "name": "El Fortín"],
                        [ "name": "El Manzano"], [ "name": "El Rastreador"], [ "name": "El Rodeo"], [ "name": "El Tío"],
                        [ "name": "Elena"], [ "name": "Embalse"], [ "name": "Esquina"], [ "name": "Estación Gral. Paz"],
                        [ "name": "Estación Juárez Celman"], [ "name": "Estancia de Guadalupe"], [ "name": "Estancia Vieja"],
                        [ "name": "Etruria"], [ "name": "Eufrasio Loza"], [ "name": "Falda del Carmen"], [ "name": "Freyre"],
                        [ "name": "Gral. Baldissera"], [ "name": "Gral. Cabrera"], [ "name": "Gral. Deheza"],
                        [ "name": "Gral. Fotheringham"], [ "name": "Gral. Levalle"], [ "name": "Gral. Roca"],
                        [ "name": "Guanaco Muerto"], [ "name": "Guasapampa"], [ "name": "Guatimozin"], [ "name": "Gutenberg"],
                        [ "name": "Hernando"], [ "name": "Huanchillas"], [ "name": "Huerta Grande"], [ "name": "Huinca Renanco"],
                        [ "name": "Idiazabal"], [ "name": "Impira"], [ "name": "Inriville"], [ "name": "Isla Verde"],
                        [ "name": "Italó"], [ "name": "James Craik"], [ "name": "Jesús María"], [ "name": "Jovita"],
                        [ "name": "Justiniano Posse"], [ "name": "Km 658"], [ "name": "L. V. Mansilla"], [ "name": "La Batea"],
                        [ "name": "La Calera"], [ "name": "La Carlota"], [ "name": "La Carolina"], [ "name": "La Cautiva"],
                        [ "name": "La Cesira"], [ "name": "La Cruz"], [ "name": "La Cumbre"], [ "name": "La Cumbrecita"],
                        [ "name": "La Falda"], [ "name": "La Francia"], [ "name": "La Granja"], [ "name": "La Higuera"],
                        [ "name": "La Laguna"], [ "name": "La Paisanita"], [ "name": "La Palestina"], [ "name": "12"],
                        [ "name": "La Paquita"], [ "name": "La Para"], [ "name": "La Paz"], [ "name": "La Playa"],
                        [ "name": "La Playosa"], [ "name": "La Población"], [ "name": "La Posta"], [ "name": "La Puerta"],
                        [ "name": "La Quinta"], [ "name": "La Rancherita"], [ "name": "La Rinconada"], [ "name": "La Serranita"],
                        [ "name": "La Tordilla"], [ "name": "Laborde"], [ "name": "Laboulaye"], [ "name": "Laguna Larga"],
                        [ "name": "Las Acequias"], [ "name": "Las Albahacas"], [ "name": "Las Arrias"], [ "name": "Las Bajadas"],
                        [ "name": "Las Caleras"], [ "name": "Las Calles"], [ "name": "Las Cañadas"], [ "name": "Las Gramillas"],
                        [ "name": "Las Higueras"], [ "name": "Las Isletillas"], [ "name": "Las Junturas"], [ "name": "Las Palmas"],
                        [ "name": "Las Peñas"], [ "name": "Las Peñas Sud"], [ "name": "Las Perdices"], [ "name": "Las Playas"],
                        [ "name": "Las Rabonas"], [ "name": "Las Saladas"], [ "name": "Las Tapias"], [ "name": "Las Varas"],
                        [ "name": "Las Varillas"], [ "name": "Las Vertientes"], [ "name": "Leguizamón"], [ "name": "Leones"],
                        [ "name": "Los Cedros"], [ "name": "Los Cerrillos"], [ "name": "Los Chañaritos (C.E)"],
                        [ "name": "Los Chanaritos (R.S)"], [ "name": "Los Cisnes"], [ "name": "Los Cocos"],
                        [ "name": "Los Cóndores"], [ "name": "Los Hornillos"], [ "name": "Los Hoyos"], [ "name": "Los Mistoles"],
                        [ "name": "Los Molinos"], [ "name": "Los Pozos"], [ "name": "Los Reartes"], [ "name": "Los Surgentes"],
                        [ "name": "Los Talares"], [ "name": "Los Zorros"], [ "name": "Lozada"], [ "name": "Luca"], [ "name": "Luque"],
                        [ "name": "Luyaba"], [ "name": "Malagueño"], [ "name": "Malena"], [ "name": "Malvinas Argentinas"],
                        [ "name": "Manfredi"], [ "name": "Maquinista Gallini"], [ "name": "Marcos Juárez"], [ "name": "Marull"],
                        [ "name": "Matorrales"], [ "name": "Mattaldi"], [ "name": "Mayu Sumaj"], [ "name": "Media Naranja"],
                        [ "name": "Melo"], [ "name": "Mendiolaza"], [ "name": "Mi Granja"], [ "name": "Mina Clavero"],
                        [ "name": "Miramar"], [ "name": "Morrison"], [ "name": "Morteros"], [ "name": "Mte. Buey"],
                        [ "name": "Mte. Cristo"], [ "name": "Mte. De Los Gauchos"], [ "name": "Mte. Leña"], [ "name": "Mte. Maíz"],
                        [ "name": "Mte. Ralo"], [ "name": "Nicolás Bruzone"], [ "name": "Noetinger"], [ "name": "Nono"],
                        [ "name": "Nueva 7"], [ "name": "Obispo Trejo"], [ "name": "Olaeta"], [ "name": "Oliva"],
                        [ "name": "Olivares San Nicolás"], [ "name": "Onagolty"], [ "name": "Oncativo"], [ "name": "Ordoñez"],
                        [ "name": "Pacheco De Melo"], [ "name": "Pampayasta N."], [ "name": "Pampayasta S."], [ "name": "Panaholma"],
                        [ "name": "Pascanas"], [ "name": "Pasco"], [ "name": "Paso del Durazno"], [ "name": "Paso Viejo"],
                        [ "name": "Pilar"], [ "name": "Pincén"], [ "name": "Piquillín"], [ "name": "Plaza de Mercedes"],
                        [ "name": "Plaza Luxardo"], [ "name": "Porteña"], [ "name": "Potrero de Garay"], [ "name": "Pozo del Molle"],
                        [ "name": "Pozo Nuevo"], [ "name": "Pueblo Italiano"], [ "name": "Puesto de Castro"], [ "name": "Punta del Agua"],
                        [ "name": "Quebracho Herrado"], [ "name": "Quilino"], [ "name": "Rafael García"], [ "name": "Ranqueles"],
                        [ "name": "Rayo Cortado"], [ "name": "Reducción"], [ "name": "Rincón"], [ "name": "Río Bamba"],
                        [ "name": "Río Ceballos"], [ "name": "Río Cuarto"], [ "name": "Río de Los Sauces"], [ "name": "Río Primero"],
                        [ "name": "Río Segundo"], [ "name": "Río Tercero"], [ "name": "Rosales"], [ "name": "Rosario del Saladillo"],
                        [ "name": "Sacanta"], [ "name": "Sagrada Familia"], [ "name": "Saira"], [ "name": "Saladillo"], [ "name": "Saldán"],
                        [ "name": "Salsacate"], [ "name": "Salsipuedes"], [ "name": "Sampacho"], [ "name": "San Agustín"],
                        [ "name": "San Antonio de Arredondo"], [ "name": "San Antonio de Litín"], [ "name": "San Basilio"],
                        [ "name": "San Carlos Minas"], [ "name": "San Clemente"], [ "name": "San Esteban"],
                        [ "name": "San Francisco"], [ "name": "San Ignacio"], [ "name": "San Javier"], [ "name": "San Jerónimo"],
                        [ "name": "San Joaquín"], [ "name": "San José de La Dormida"], [ "name": "San José de Las Salinas"],
                        [ "name": "San Lorenzo"], [ "name": "San Marcos Sierras"], [ "name": "San Marcos Sud"], [ "name": "San Pedro"],
                        [ "name": "San Pedro N."], [ "name": "San Roque"], [ "name": "San Vicente"], [ "name": "Santa Catalina"],
                        [ "name": "Santa Elena"], [ "name": "Santa Eufemia"], [ "name": "Santa Maria"], [ "name": "Sarmiento"],
                        [ "name": "Saturnino M.Laspiur"], [ "name": "Sauce Arriba"], [ "name": "Sebastián Elcano"], [ "name": "Seeber"],
                        [ "name": "Segunda Usina"], [ "name": "Serrano"], [ "name": "Serrezuela"], [ "name": "Sgo. Temple"],
                        [ "name": "Silvio Pellico"], [ "name": "Simbolar"], [ "name": "Sinsacate"], [ "name": "Sta. Rosa de Calamuchita"],
                        [ "name": "Sta. Rosa de Río Primero"], [ "name": "Suco"], [ "name": "Tala Cañada"], [ "name": "Tala Huasi"],
                        [ "name": "Talaini"], [ "name": "Tancacha"], [ "name": "Tanti"], [ "name": "Ticino"], [ "name": "Tinoco"],
                        [ "name": "Tío Pujio"], [ "name": "Toledo"], [ "name": "Toro Pujio"], [ "name": "Tosno"], [ "name": "Tosquita"],
                        [ "name": "Tránsito"], [ "name": "Tuclame"], [ "name": "Tutti"], [ "name": "Ucacha"], [ "name": "Unquillo"],
                        [ "name": "Valle de Anisacate"], [ "name": "Valle Hermoso"], [ "name": "Vélez Sarfield"], [ "name": "Viamonte"],
                        [ "name": "Vicuña Mackenna"], [ "name": "Villa Allende"], [ "name": "Villa Amancay"], [ "name": "Villa Ascasubi"],
                        [ "name": "Villa Candelaria N."], [ "name": "Villa Carlos Paz"], [ "name": "Villa Cerro Azul"],
                        [ "name": "Villa Ciudad de América"], [ "name": "Villa Ciudad Pque Los Reartes"], [ "name": "Villa Concepción del Tío"],
                        [ "name": "Villa Cura Brochero"], [ "name": "Villa de Las Rosas"], [ "name": "Villa de María"], [ "name": "Villa de Pocho"],
                        [ "name": "Villa de Soto"], [ "name": "Villa del Dique"], [ "name": "Villa del Prado"], [ "name": "Villa del Rosario"],
                        [ "name": "Villa del Totoral"], [ "name": "Villa Dolores"], [ "name": "Villa El Chancay"], [ "name": "Villa Elisa"],
                        [ "name": "Villa Flor Serrana"], [ "name": "Villa Fontana"], [ "name": "Villa Giardino"], [ "name": "Villa Gral. Belgrano"],
                        [ "name": "Villa Gutierrez"], [ "name": "Villa Huidobro"], [ "name": "Villa La Bolsa"], [ "name": "Villa Los Aromos"],
                        [ "name": "Villa Los Patos"], [ "name": "Villa María"], [ "name": "Villa Nueva"], [ "name": "Villa Pque. Santa Ana"],
                        [ "name": "Villa Pque. Siquiman"], [ "name": "Villa Quillinzo"], [ "name": "Villa Rossi"], [ "name": "Villa Rumipal"],
                        [ "name": "Villa San Esteban"], [ "name": "Villa San Isidro"], [ "name": "Villa 21"], [ "name": "Villa Sarmiento (G.R)"],
                        [ "name": "Villa Sarmiento (S.A)"], [ "name": "Villa Tulumba"], [ "name": "Villa Valeria"], [ "name": "Villa Yacanto"],
                        [ "name": "Washington"], [ "name": "Wenceslao Escalante"], [ "name": "Ycho Cruz Sierras"]]
        ciudades.each {
            new Ciudad(descripcion: it.name).save(failOnError: true)
        }


    }
    def destroy = {
    }
}
