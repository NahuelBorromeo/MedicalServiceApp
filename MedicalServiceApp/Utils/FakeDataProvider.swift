//
//  FakeDataProvider.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import Foundation

struct FakeDataProvider {
    
    static func getCategories() -> [Category] {
        return [
            Category(medicalCategory: .generalMedicine, iconName: "general_icon"),
            Category(medicalCategory: .emergency, iconName: "emergency_icon"),
            Category(medicalCategory: .pediatrics, iconName: "pediatrics_icon"),
            Category(medicalCategory: .dentistry, iconName: "dentistry_icon"),
            Category(medicalCategory: .rehabilitation, iconName: "rehabilitation_icon"),
            Category(medicalCategory: .psychology, iconName: "psychology_icon")
        ]
    }
    
    static func getDoctors() -> [Doctor] {
        return [
            Doctor(
                name: "Dr. Olivia Wilson",
                specialty: MedicalCategory.generalMedicine.rawValue,
                rating: 4.9,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor6",
                biography: """
                Dr. Olivia Wilson es una médica general con más de 15 años de experiencia. Se graduó con honores de la Universidad de Medicina de Lima. Dr. Wilson está comprometida a proporcionar atención médica integral y centrada en el paciente. Ella cree en la importancia de la prevención y la educación para la salud.
                """
            ),
            Doctor(
                name: "Dr. Nahuel Borromeo",
                specialty: MedicalCategory.rehabilitation.rawValue,
                rating: 4.8,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "nahuel",
                biography: """
                Dr. Nahuel Borromeo es un especialista en rehabilitación reconocido por su enfoque innovador. Ha trabajado en diversos centros de rehabilitación en Europa y América Latina. Su pasión es ayudar a los pacientes a recuperar su movilidad y mejorar su calidad de vida. Dr. Borromeo combina técnicas tradicionales y modernas para personalizar la recuperación de cada paciente.
                """
            ),
            Doctor(
                name: "Dr. Laura Sanchez",
                specialty: MedicalCategory.emergency.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor7",
                biography: """
                Dr. Laura Sanchez es una experta en medicina de emergencias con una década de experiencia en entornos de alta presión. Ha liderado equipos de emergencia en hospitales de todo el país. Su enfoque rápido y eficiente ha salvado innumerables vidas. Dr. Sanchez es conocida por su calma en situaciones de crisis.
                """
            ),
            Doctor(
                name: "Dr. Alex Fuentes",
                specialty: MedicalCategory.emergency.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor1",
                biography: """
                Dr. Alex Fuentes es un médico de emergencias que ha dedicado su carrera a mejorar la respuesta médica en situaciones críticas. Con formación en trauma y soporte vital avanzado, ha trabajado en los principales hospitales de la ciudad. Dr. Fuentes es un defensor de la educación continua para profesionales de la salud.
                """
            ),
            Doctor(
                name: "Dr. Camila Lopez",
                specialty: MedicalCategory.pediatrics.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor8",
                biography: """
                Dr. Camila Lopez es pediatra con una visión apasionada por el bienestar infantil. Se graduó de la Universidad de Buenos Aires y ha trabajado en hospitales pediátricos destacados. Su amor por los niños la impulsa a ofrecer el mejor cuidado y apoyo a las familias. Dr. Lopez también participa activamente en programas comunitarios de salud infantil.
                """
            ),
            Doctor(
                name: "Dr. Walter Gonzales",
                specialty: MedicalCategory.dentistry.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "dentistry",
                biography: """
                Dr. Walter Gonzales es un dentista con una trayectoria impecable de más de 20 años. Ha transformado las sonrisas de muchos pacientes con su habilidad y dedicación. Dr. Gonzales se especializa en ortodoncia y estética dental. Su consultorio es un espacio acogedor donde los pacientes reciben un trato amable y profesional.
                """
            ),
            Doctor(
                name: "Dr. Roberto Sanchez",
                specialty: MedicalCategory.rehabilitation.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor2",
                biography: """
                Dr. Roberto Sanchez es un experto en medicina de rehabilitación. Con más de 15 años de experiencia, ha trabajado con pacientes en procesos de recuperación postoperatoria. Dr. Sanchez utiliza un enfoque integrador que combina fisioterapia, tecnología de vanguardia y apoyo emocional. Su dedicación a cada paciente es evidente en cada sesión.
                """
            ),
            Doctor(
                name: "Dr. Pedro Perez",
                specialty: MedicalCategory.psychology.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor3",
                biography: """
                Dr. Pedro Perez es un psicólogo clínico apasionado por ayudar a sus pacientes a alcanzar un bienestar mental y emocional. Se especializa en terapia cognitivo-conductual y ha trabajado en diversas clínicas de salud mental. Dr. Perez es conocido por su enfoque empático y personalizado, y por su capacidad para construir relaciones terapéuticas sólidas.
                """
            ),
            Doctor(
                name: "Dr. Camilo Silva",
                specialty: MedicalCategory.pediatrics.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor4",
                biography: """
                Dr. Camilo Silva es un pediatra dedicado a la salud y el desarrollo de los niños. Se graduó de la Universidad Nacional de Colombia y ha dedicado su carrera a la pediatría comunitaria. Dr. Silva trabaja estrechamente con los padres para asegurar que los niños reciban el mejor cuidado posible desde una edad temprana.
                """
            ),
            Doctor(
                name: "Dr. Juan Perez",
                specialty: MedicalCategory.dentistry.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor5",
                biography: """
                Dr. Juan Perez es un destacado dentista que ha mejorado la salud oral de sus pacientes durante más de una década. Se especializa en cirugía dental y cuidados preventivos. Dr. Perez se enfoca en la educación del paciente para asegurar una higiene bucal óptima. Su clínica es conocida por ofrecer servicios dentales de alta calidad.
                """
            ),
            Doctor(
                name: "Dr. Olivia Wilson",
                specialty: MedicalCategory.generalMedicine.rawValue,
                rating: 4.3,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor6",
                biography: """
                Dr. Olivia Wilson es una médica general con más de 15 años de experiencia. Se graduó con honores de la Universidad de Medicina de Lima. Dr. Wilson está comprometida a proporcionar atención médica integral y centrada en el paciente. Ella cree en la importancia de la prevención y la educación para la salud.
                """
            ),
            Doctor(
                name: "Dr. Nahuel Borromeo",
                specialty: MedicalCategory.rehabilitation.rawValue,
                rating: 4.2,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "nahuel",
                biography: """
                Dr. Nahuel Borromeo es un especialista en rehabilitación reconocido por su enfoque innovador. Ha trabajado en diversos centros de rehabilitación en Europa y América Latina. Su pasión es ayudar a los pacientes a recuperar su movilidad y mejorar su calidad de vida. Dr. Borromeo combina técnicas tradicionales y modernas para personalizar la recuperación de cada paciente.
                """
            ),
            Doctor(
                name: "Dr. Laura Sanchez",
                specialty: MedicalCategory.emergency.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor7",
                biography: """
                Dr. Laura Sanchez es una experta en medicina de emergencias con una década de experiencia en entornos de alta presión. Ha liderado equipos de emergencia en hospitales de todo el país. Su enfoque rápido y eficiente ha salvado innumerables vidas. Dr. Sanchez es conocida por su calma en situaciones de crisis.
                """
            ),
            Doctor(
                name: "Dr. Alex Fuentes",
                specialty: MedicalCategory.emergency.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor1",
                biography: """
                Dr. Alex Fuentes es un médico de emergencias que ha dedicado su carrera a mejorar la respuesta médica en situaciones críticas. Con formación en trauma y soporte vital avanzado, ha trabajado en los principales hospitales de la ciudad. Dr. Fuentes es un defensor de la educación continua para profesionales de la salud.
                """
            ),
            Doctor(
                name: "Dr. Camila Lopez",
                specialty: MedicalCategory.pediatrics.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor8",
                biography: """
                Dr. Camila Lopez es pediatra con una visión apasionada por el bienestar infantil. Se graduó de la Universidad de Buenos Aires y ha trabajado en hospitales pediátricos destacados. Su amor por los niños la impulsa a ofrecer el mejor cuidado y apoyo a las familias. Dr. Lopez también participa activamente en programas comunitarios de salud infantil.
                """
            ),
            Doctor(
                name: "Dr. Walter Gonzales",
                specialty: MedicalCategory.dentistry.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "dentistry",
                biography: """
                Dr. Walter Gonzales es un dentista con una trayectoria impecable de más de 20 años. Ha transformado las sonrisas de muchos pacientes con su habilidad y dedicación. Dr. Gonzales se especializa en ortodoncia y estética dental. Su consultorio es un espacio acogedor donde los pacientes reciben un trato amable y profesional.
                """
            ),
            Doctor(
                name: "Dr. Roberto Sanchez",
                specialty: MedicalCategory.rehabilitation.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor2",
                biography: """
                Dr. Roberto Sanchez es un experto en medicina de rehabilitación. Con más de 15 años de experiencia, ha trabajado con pacientes en procesos de recuperación postoperatoria. Dr. Sanchez utiliza un enfoque integrador que combina fisioterapia, tecnología de vanguardia y apoyo emocional. Su dedicación a cada paciente es evidente en cada sesión.
                """
            ),
            Doctor(
                name: "Dr. Pedro Perez",
                specialty: MedicalCategory.psychology.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor3",
                biography: """
                Dr. Pedro Perez es un psicólogo clínico apasionado por ayudar a sus pacientes a alcanzar un bienestar mental y emocional. Se especializa en terapia cognitivo-conductual y ha trabajado en diversas clínicas de salud mental. Dr. Perez es conocido por su enfoque empático y personalizado, y por su capacidad para construir relaciones terapéuticas sólidas.
                """
            ),
            Doctor(
                name: "Dr. Camilo Silva",
                specialty: MedicalCategory.pediatrics.rawValue,
                rating: 4.6,
                reviews: 57,
                address: "123 Main St",
                consultationPrice: "S/.100",
                contactInfo: "555-1234",
                schedule: "9am - 5pm",
                image: "doctor4",
                biography: """
                Dr. Camilo Silva es un pediatra dedicado a la salud y el desarrollo de los niños. Se graduó de la Universidad Nacional de Colombia y ha dedicado su carrera a la pediatría comunitaria. Dr. Silva trabaja estrechamente con los padres para asegurar que los niños reciban el mejor cuidado posible desde una edad temprana.
                """
            ),
            Doctor(
                name: "Dr. Juan Perez",
                specialty: MedicalCategory.dentistry.rawValue,
                rating: 4.6,
                reviews: 39,
                address: "Villa el Salvador 15829",
                consultationPrice: "S/.150",
                contactInfo: "971293262",
                schedule: "9am - 5pm",
                image: "doctor5",
                biography: """
                Dr. Juan Perez es un destacado dentista que ha mejorado la salud oral de sus pacientes durante más de una década. Se especializa en cirugía dental y cuidados preventivos. Dr. Perez se enfoca en la educación del paciente para asegurar una higiene bucal óptima. Su clínica es conocida por ofrecer servicios dentales de alta calidad.
                """
            ),
        ]
    }
}
