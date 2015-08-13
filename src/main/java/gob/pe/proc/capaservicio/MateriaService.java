package gob.pe.proc.capaservicio;

import gob.pe.proc.capadatos.Materia;
import gob.pe.proc.capadatos.Naturaleza;

import java.util.List;


public interface MateriaService {
	public List<Materia> obtenerListaMateria(Materia materia);
	public Materia obtenerMateriaporId(Integer idMateria);
	public void guardarMateria(Materia materia);
	public void borrarMateria(Integer idMateria);
	public List<Naturaleza> obtenerListaNaturaleza();
}
