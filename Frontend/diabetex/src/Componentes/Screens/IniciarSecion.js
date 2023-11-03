import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";
import axios from "axios"
import { Login } from "../utils";

export default function InicioSesion() {
    const [mailState, setMail] = useState('');
    const [passwordState, setPassword] = useState('');
    const navigate = useNavigate();

    async function ingresarCuenta(event) {
        event.preventDefault();

        const response = await Login(mailState, passwordState)
   
  
        if (response) {
          
          navigate ("/Home")
         
        } else {
          
          alert('Credenciales incorrectas');
        }
     
      }
    

       /* try {
            const response = await
                fetch("http://A-PHZ2-CIDI-020:3000/api/usuario/login", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        mail: mailState,
                        password: passwordState
                    })
                });

            if (response.ok) {
                console.log("Navigating to /Home")
                navigate('/Home');
            } else {
                alert("Credenciales incorrectas");
            }
        } catch (error) {
            console.error("Error al iniciar sesión:", error);
        }

        fetch('http://A-PHZ2-CIDI-020:3000/api/usuario/login')
            .then(response => {
                if (!response.ok) {
                    throw new Error('La solicitud no fue exitosa');
                }
                return response.json();
            })
            .then(data => {

            })
            .catch(error => {
                console.error('Error al realizar la solicitud:', error);
            });
    }*/

    return (

        <div className=" App-header d-flex flex-column justify-content-between">
            <img src="/img/logo.jpg" className="App-logo" alt=""></img>
            <br></br>

            <form onSubmit={ingresarCuenta}>
                <input type="text" name="mail" placeholder=" email o usuario"
                    className="formulario" onChange={(e) => setMail(e.target.value)} />
                <br></br><br></br>
                <input type="password" name="password"
                    placeholder="Contraseña" className="formulario" onChange={(e) =>
                        setPassword(e.target.value)} />
                <br></br><br></br>
                <center> <button type="submit" className="boton">Iniciar Sesion</button> </center>
            </form>
            <center> <Link to="/Registrarse"> Registrarse</Link> </center>

        </div>
    );
}
