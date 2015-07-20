package gob.pe.proc.capaweb;

import gob.pe.proc.capadatos.Estado;
import gob.pe.proc.capadatos.Instancia;
import gob.pe.proc.capadatos.Naturaleza;
import gob.pe.proc.capadatos.Organojudicial;
import gob.pe.proc.capadatos.Proceso;
import gob.pe.proc.capadatos.Ubigeo;
import gob.pe.proc.capaservicio.InstanciaService;
import gob.pe.proc.capaservicio.ProcesoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;




import net.sf.jasperreports.engine.JRDataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReportesController {
	@Autowired
	ProcesoService procesoService;
	@Autowired
	InstanciaService instanciaService;
	
	private static final Logger logger=Logger.getLogger(ReportesController.class);
	
	@RequestMapping(value = "/reporteEstadoProceso", method = RequestMethod.GET)
	public void enviarProcesoEstado(ModelAndView modelAndView,@ModelAttribute("fechasProceso")Proceso proceso){
		new Proceso();
	}
    @RequestMapping(value = "/reporteEstadoProceso", method = RequestMethod.POST)
    public ModelAndView reporteEstadoProceso(ModelAndView modelAndView,@ModelAttribute("fechasProceso")Proceso proceso) {
    	JRDataSource datasource=procesoService.reporteEstadoProceso(proceso);
    	Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("pdfReportEstado", parameterMap);
		return modelAndView;
	}
    @RequestMapping(value = "/reporteMateriaProceso", method = RequestMethod.GET)
	public void enviarProcesoMateria(ModelAndView modelAndView,@ModelAttribute("materiaProceso")Proceso proceso){
		new Proceso();
	}
    @RequestMapping(value = "/reporteMateriaProceso", method = RequestMethod.POST)
    public ModelAndView reporteMateriaProceso(ModelAndView modelAndView,@ModelAttribute("materiaProceso")Proceso proceso) {
    	JRDataSource datasource=procesoService.reporteMateriaProceso(proceso);
    	Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("pdfReportMateria", parameterMap);
		return modelAndView;
	}
    @RequestMapping(value = "/reporteUbigeoProceso", method = RequestMethod.GET)
	public void enviarInstancia(ModelAndView modelAndView,@ModelAttribute("ubigeoInstancia")Instancia instancia){
		new Instancia();
	}
    @RequestMapping(value = "/reporteUbigeoProceso", method = RequestMethod.POST)
    public ModelAndView reporteInstancia(ModelAndView modelAndView,@ModelAttribute("ubigeoInstancia")Instancia instancia) {
    	JRDataSource datasource=instanciaService.reporteInstanciaUbigeo(instancia);
    	Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("pdfReportUbigeo", parameterMap);
		return modelAndView;
	}
    
    @RequestMapping(value = "/reporteDependenciaProceso", method = RequestMethod.GET)
   	public void enviarDependencia(ModelAndView modelAndView,@ModelAttribute("dependenciaInstancia")Instancia instancia){
   		new Instancia();
   	}
       @RequestMapping(value = "/reporteDependenciaProceso", method = RequestMethod.POST)
       public ModelAndView reporteDependencia(ModelAndView modelAndView,@ModelAttribute("dependenciaInstancia")Instancia instancia) {
       	JRDataSource datasource=instanciaService.reporteDependenciaInstancia(instancia);
       	Map<String,Object> parameterMap = new HashMap<String,Object>();
   		parameterMap.put("datasource", datasource);
   		modelAndView = new ModelAndView("pdfReportDependencia", parameterMap);
   		return modelAndView;
   	}
	@ModelAttribute("tipoEstado")
	public List<Estado> listarEstado(){
		List<Estado> tipoEstado=procesoService.listarEstado();
		return tipoEstado;
	}
	@ModelAttribute("tipoNaturaleza")
	public List<Naturaleza>listarNaturaleza(){
		List<Naturaleza> tipoNaturaleza=procesoService.listarNaturaleza();
		return tipoNaturaleza;
	}
	@ModelAttribute("tipoUbigeo")
	public List<Ubigeo>listarUbigeo(){
		List<Ubigeo> tipoUbigeo=procesoService.listarUbigeo();
		return tipoUbigeo;
	}
	@ModelAttribute("organosJudiciales")
	public List<Organojudicial> listarOrganosJudiciales(){
		List<Organojudicial> organoJudicial=instanciaService.listarOrganosJudiciales();
		return organoJudicial;
	}
}
