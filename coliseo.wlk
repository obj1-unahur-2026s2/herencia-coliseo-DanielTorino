
class Arma{

 method poderDeAtaque()    

} 

class ArmasDeFilo inherits Arma{
    
   var filo = 0.5
   var longitud
   override method poderDeAtaque(){ return filo * longitud}
   method filo(){ return filo}
   method filo(nuevoFilo){filo = nuevoFilo.max(0).min(1)}
}

class ArmasCoontundentes inherits Arma{

     var peso 
    override method poderDeAtaque(){return peso}

}

  class Casco{
    method puntoDeDefensa(gladiador){return 10}
  }
  class Escudo{
    method puntosDeDefensa(gladiador){ return 5 + (gladiador.destreza() * 0.10)}

  }
  class Gladiador {
    var property fuerza
    var property destreza 
    const property vida = 100
    method poderDeAtaque()
    method defensaTotal()
    method recibirDanio(cantidad){ vida =(vida-cantidad).max(0)}
    method atacar(unGladiador){
        const danio = (self.poderDeAtaque()-unGladiador.defensaTotal()).max(0)
        unGladiador.recibirDanio(danio)
    method pelea(unGladiador){ self.atacar(unGladiador); unGladiador.atacar(self)}  
    }
    method puedeCombatir(){return vida >0}
    method crearGrupoCon(otroGladiador){
        const nombreGrupo = self.nombreParaGrupoNuevo(otroGladiador)
        return new Grupo (nombre = nombreGrupo, miembros =[self,otroGladiador])
    method nombreParaGrupoNuevo(otroGladiador)    
    }
    
  }

  class Mirmillones inherits Gladiador{ 
    var property armaEquipada
    var property armaduraEquipada
    override method nombreParaGrupoNuevo(otroGladiador){return "mirmillolandia"}
    override method poderDeAtaque(){return armaEquipada.poderDeAtaque()+ self.fuerza()}
    override method defensaTotal(){ return armaduraEquipada.puntoDeDefensa() + self.destreza()}  
  }
   class Dimachaerus inherits Gladiador{ 
    const armas = []
    
    method agregarArma(arma){armas.add(arma)}
    override method poderDeAtaque(){return self.fuerza() + armas.sum({a=>a.poderDeAtaque()})}
    override method defensaTotal() = {return self.destreza()/2}
    override method atacar(unGladiador){
        super(unGladiador)
         destreza= defensa  +1}
    override method nombreParaGrupoNuevo(otroGladiador) {
        const sumaPoder= self.poderDeAtaque() + otroGladiador.poderDeAtaque()
        return "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
    }    
    
   } 
   class Grupo {
    var property nombre 
    const property miembros []
    var cantidadDePeleas = 1
    method agregarMiembro(UnGladiador){ miembros.add(unGladiador)}
    method quitarMiembro(unGladiador){miembros.remove(unGladiador)}
    method elCampeon(){ const aptos = miembros.filter({g=>g.puedeCombatir()})
                        if(aptos.isEmpty()){
                            self.error("El grupo"+ nombre + " no tiene gladiaidor")
                        }
                        return aptos.max({g=>g.poderDeAtaque()})
    }
    method registrarPelea(){
        peleasParticipadas = peleasParticipadas + 1 
    }
   
   method combatirContra(otroGrupo){
        self.registrarPelea()
        otroGrupo.registrarPelea()
        (1..3)forEach({ round =>
        const miCampeon = self.campeon()
        const campeonRival = otroGrupo.campeon()
        miCampeon.pelear(campeonRival)})


   }



   }