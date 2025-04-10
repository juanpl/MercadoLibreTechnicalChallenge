//
//  ProductInfoViewModelIntegrationTest.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 9/04/25.
//

import XCTest
@testable import MercadoLibreTechnicalChallenge

final class ProductInfoViewModelIntegrationTest: XCTestCase {
    
    var sut: ProductInfoViewModel!
    
    override func setUpWithError() throws {
        sut = ProductInfoViewModel() //sut: system under test
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetProductByIdFailed() async throws{
        
        //Given
        let id: String = "MCO90400479"
        
        //When
        await sut.loadProductInfo(id: id)
        
        //Then
        XCTAssertNil(sut.product)
        XCTAssertEqual(sut.showErrorMessage, true)
        XCTAssertEqual(sut.errorMessage, "Error cargando el producto")
        
    }
    
    func testGetProductByIdSucces() async throws{
        
        //Given
        let id: String = "MCO30400479"
        
        //When
        await sut.loadProductInfo(id: id)
        let productReference = Product(
            id: "MCO30400479",
            title: " iPhone 3G",
            description: "Si buscas un dispositivo que te permita estar en contacto siempre, este teléfono iPhone 3G es una opción excelente. Podrás comunicarte de manera inmediata con amigas y amigos, o con las personas de tu familia. Y además, si estás trabajando, lograrás una mayor colaboración con tu equipo. \n\n",
            productFeatures: ["Dispositivo desbloqueado para que elijas la compañía telefónica que prefieras."],
            productAttributes: [
                "Marca":"Apple",
                "Línea":"iPhone 3",
                "Modelo":"iPhone 3G",
                "Es Dual SIM": "No",
                "Nombre del sistema operativo": "iOS",
                "Número de homologación de Anatel": "11240801993",
                "Versiones":"A1324, A1241"
                
            ],
            images: [
                "https://http2.mlstatic.com/D_NQ_NP_796973-MLA28284457453_102018-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_795144-MLU78959265312_092024-F.jpg"
            ],
            price: nil)
        
        //Then
        XCTAssertNotNil(sut.product)
        XCTAssertEqual(sut.showErrorMessage, false)
        XCTAssertEqual(sut.product, productReference)
        XCTAssertEqual(sut.errorMessage, "")

    }
    
    func testGetProductWithPriceByIdSucces() async throws{
        
        //Given
        let id: String = "MCO26031780"
        
        //When
        await sut.loadProductInfo(id: id)
        let productReference = Product(
            id: "MCO26031780",
            title: "Ratón Inalámbrico Mouse Silencioso Portátil 2.4g 3 Dpi Ratón De Computadora Con Receptor Usb Para Laptop, Pc, Notebook Pilas Aa Incluidas 1Hora RAT001",
            description: "Parámetros técnicos:\nColor: negro\nCarga: AA Pilas (No Recargable.)\nDistancia inalámbrica: 10M\nSistema: Android/IOS/Windows\n\nCómo usar un ratón inalámbrico\n1. Abre la tapa en la parte inferior, quita la etiqueta de aislamiento e instala la batería AA.\n2. Saca el receptor USB que está cerca del compartimento de la batería y conéctalo a la computadora.\n3. Enciende el interruptor ON/OFF en la parte inferior.\n4. ¡Ya puedes empezar a usarlo!\n\nNota:\n1) Por favor, asegúrate de insertar el receptor USB en la computadora.\n2) Se requiere 1 pila AA para su uso, no recargable.\n\n1.3 Niveles de DPI ajustables: Con 3 niveles de DPI ajustables (1600/1200/800), este mouse inalambrico proporciona una mayor sensibilidad para un seguimiento rápido y preciso. Incluso en diferentes superficies, el sensor óptico del ratón funciona sin problemas y con precisión en funcionamiento de alta velocidad, perfecto para pantallas 4K/8K HD\n\n2. Ratón ergonómico de tamaño completo: El mouse computadora ergonómico sigue las curvas naturales con un agarre de goma suave y una amplia zona para la palma de la mano, además de laterales esculpidos para un mayor agarre, lo que mejora enormemente la comodidad y alivia la fatiga de hombros o muñecas tras largas horas de trabajo.\n\n3. Funcionalidad al alcance de la mano: El dpi mouse 1Hora ergo cuenta con cuatro botones estándar y un botón de atrás/adelante, lo que facilita la navegación por Internet tanto en modo Mac como Windows.\n\n4.MOUSE ULTRA QUIETO: Este mouse para portátiles cuenta con un diseño silencioso que reduce el sonido de los clics en un 90% y realiza una cancelación de ruido de 60dB, por lo que es super silencioso tanto si hace clic en los botones como si se desplaza o mueve el ratón, lo que lo convierte en el mouse ideal para ordenadores, salas de conferencias, cafeterías, bibliotecas y dormitorios.\n\n5.AMPLIA COMPATIBILIDAD: Este mouse inalámbrico es fácilmente compatible con Windows 7/8.1/10/11/XP, macOS, Linux, Chrome OS, Android. para portátiles, PCs, MacBooks, Chromebooks, Tablets, Notebooks, etc.\n\n6.La transmisión es más estable: 1Hora RAT001N 2.4GHz mouse inalámbrico de transmisión es más estable, la distancia de transmisión es farther.10M distancia de transmisión para satisfacer sus necesidades de oficina, por lo que las dificultades de desconexión del mouse inalámbrico ya no te molestan.",
            productFeatures: [
                "Es inalámbrico.",
                "Orientación de la mano: ambidiestro.",
                "Posee rueda de desplazamiento.",
                "Cuenta con interruptor de ahorro de energía.",
                "Con sensor óptico.",
                "Resolución de 1600dpi.",
                "AA Pilas Incluye (No Recargable.)",
                "Por favor, asegúrate de insertar el receptor USB en la computadora"
            ],
            productAttributes: [
                "Marca": "1Hora",
                "Modelo": "RAT001",
                "Color": "Negro",
                "Color principal": "Negro",
                "Tipo de sensor": "Óptico",
                "Tecnología del sensor": "2.4 Ghz",
                "Resolución del sensor": "1600 dpi",
                "Con Bluetooth": "No",
                "Con interruptor de ahorro de energía": "Sí",
                "Con cable": "No",
                "Con cable retráctil": "No",
                "Con rueda de desplazamiento": "Sí",
                "Con luces": "No",
                "Incluye pilas": "Sí",
                "Incluye mousepad": "No",
                "Tipo de mouse": "Inalambrico",
                "Orientación de la mano": "Ambidiestro",
                "Sistemas operativos compatibles": "Windows 10, Windows 11, Windows 7, Windows 8, macOS",
                "Con conexión USB": "Sí",
                "Es inalámbrico": "Sí",
                "Velocidad máxima": "30 ips",
                "Cantidad de botones": "4",
                "Interfaces": "USB",
                "Tipo de alimentación inalámbrica": "Pilas",
                "Alcance máximo": "10 m",
                "Es ergonómica": "Sí",
                "Es recargable": "No",
                "Es gamer": "Sí"
            ],
            images: [
                "https://http2.mlstatic.com/D_NQ_NP_898913-MLU71086290959_082023-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_853217-MLA83025849580_032025-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_600826-MLU71087299171_082023-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_603437-MLU71049232244_082023-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_788157-MLU71049232240_082023-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_768824-MLU71087299169_082023-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_624851-MLU71087299175_082023-F.jpg"
            ],
            price: 18593)
        
        XCTAssertNotNil(sut.product)
        XCTAssertEqual(sut.showErrorMessage, false)
        XCTAssertEqual(sut.product, productReference)
        XCTAssertEqual(sut.errorMessage, "")
        
        
    }
    
}
