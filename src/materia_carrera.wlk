class Materia {
	const property inscriptos = []
	const property colaDeEspera = []
	const property requisitos = []
	var property cupo
	
	method anotar(estudiante) {
		if (self.completa()) {
			colaDeEspera.add(estudiante)
		} else {
			inscriptos.add(estudiante)
		}
	}
	
	method completa() {
		return inscriptos.size() == cupo
	}
	
}


class Carrera {
	var property materias = []
}