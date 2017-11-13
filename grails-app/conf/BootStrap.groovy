import amordepatitas.Raza
import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole

import java.text.DateFormat
import java.text.SimpleDateFormat

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
        def mascotaRole = SecRole.findByAuthority('ROLE_MASCOTA') ?: new SecRole(authority: 'ROLE_MASCOTA').save(failOnError: true)
        def rolePostulacion = SecRole.findByAuthority('ROLE_POSTULACION') ?: new SecRole(authority: 'ROLE_POSTULACION').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                name: 'admin',
                email: 'nicolas.gnesio@mercadolibre.com',
                dateBirth: new Date(),
                password: 'admin',
                sexo: 'masculino',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create(adminUser, adminRole)
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
    }
    def destroy = {
    }
}
