package gob.pe.proc.capaweb;

import gob.pe.proc.capaservicio.PerfilService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PerfilController {
	@Autowired
	private PerfilService perfilService;
}
