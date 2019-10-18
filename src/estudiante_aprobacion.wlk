class Estudiante {
	const property aprobaciones = []	
	const property carreras = []
	// esto lo cambiamos cuando nos dimos cuenta que conviene
	// que sean las materias las que memorizan las inscripciones
//	const property materiasInscripto = []
	
	method registrarAprobacion(materia, nota) {
		aprobaciones.add(
			new AprobacionMateria(materia=materia, nota=nota)
		)
	}
	
	method todasLasMaterias() {
		return carreras.map({ carrera => carrera.materias() }).flatten() 
	}
	
	method puedeCursar(materia) {
		return self.materiaEstaEnCarrerasQueEstoyCursando(materia)
			and not self.tieneAprobada(materia)
			and not self.estaInscripto(materia)
			and self.tieneTodosLosRequisitos(materia)
	}

	method inscribir(materia) {
		if (not self.puedeCursar(materia)) {
			self.error("no puedo cursar")
		}
		// acá llega **solamente** si yo puedo cursar
		materia.anotar(self)
	}
	
		

	method tieneTodosLosRequisitos(materia) {
		return materia.requisitos().all({ req => self.tieneAprobada(req) })
	}
	
	method materiaEstaEnCarrerasQueEstoyCursando(materia) {
		return self.todasLasMaterias().contains(materia)
	}
	
	method tieneAprobada(materia) {
		return aprobaciones.any({ matApr => matApr.materia() == materia })
	}
	
	method tieneAprobada_variante(materia) {
		var matAprobadas = aprobaciones.map({ apr => apr.materia() })
		return matAprobadas.contains(materia) 
	}

	method estaInscripto(materia) {
		// esto era antes de cambiar dónde se registran las inscripciones
//		return materiasInscripto.contains(materia)
		return materia.inscriptos().contains(self)
	}
	
	
}

class AprobacionMateria {
	var property materia
	var property nota
}

