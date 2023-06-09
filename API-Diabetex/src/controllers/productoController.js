
import { Router} from 'express';
import ProductoService from '../services/productoService.js';

const ProductoRouter = Router();
const productoService = new ProductoService();

//Pido a mi bd por el codigo de barra y si no lo encuentra lo pide a la api externa

ProductoRouter.get('/:codebar', async (req, res) => {
  console.log('Estoy en: ProductoController get /:codebar', req.params.codebar, ' en la API DIABETEX');
  let respuesta;
  
  let producto = await productoService.getProductoDiabetex(req.params.codebar);

  console.log('producto', producto);

  if (producto!=null){
    console.log('1');

    respuesta = res.status(200).json(producto);

  } else {
    console.log('No se encontro el producto en la API DIABETEX');
    console.log('Estoy en: ProductoController get /:codebar', req.params.codebar, ' en la API OPEN FOOD FACTS');

    let productoExterno = await productoService.getProduct(req.params.codebar);

    if (productoExterno.status!=0){

      console.log('1');
      respuesta = res.status(200).json(productoExterno);

    } else {

      console.log('0');
      respuesta = res.status(404).send("No se encontro el producto. Seria de mucha ayuda que lo agregue");

      let cuerpo = req.body;
      console.log('Estoy en: ProductoController post /', cuerpo);

      const producto = await productoService.agregarProducto(cuerpo);

      console.log("El producto fue agregado");

      respuesta = res.status(201).json(producto);

    }
  }
  return respuesta;
});


ProductoRouter.post('', async (req, res) => {
  let cuerpo = req.body;
  console.log('Estoy en: ProductoController post /', cuerpo);

  const producto = await productoService.agregarProducto(cuerpo);
  console.log("El producto fue agregado");
  return res.status(201).json(producto);
  
});

ProductoRouter.get('/', async (req, res) => {
  console.log('Estoy en: ProductoController get /');
  
  const producto = await productoService.getAll();

  return res.status(200).json(producto);
});

ProductoRouter.put('', async (req, res) => {
  let cuerpo = req.body;

  console.log('Estoy en: ProductoController put /:codigoBarra');

  const producto = await productoService.update(cuerpo);

  return res.status(200).json(producto);
});

ProductoRouter.delete('/:codigoBarra', async (req, res) => {
  console.log('Estoy en: ProductoController delete /:codigoBarra', req.params.codigoBarra);

  const producto = await productoService.deleteById(req.params.codigoBarra);

  return res.status(200).json(producto);
});

export default ProductoRouter;