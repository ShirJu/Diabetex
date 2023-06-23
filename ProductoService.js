import config from '../../dbconfig.js';
import sql from 'mssql';
import axios from 'axios';

//const URL_PRODUCT = "http://world.openfoodfacts.org/api/v0/product/";
//const URL_FIELDS = "?fields=product_name_es,quantity,brands,manufacturing_places,ingredients_text,ingredients_analysis_tags,nutrient_levels_tags,nutriments,ecoscore_data";
export default class ProductoService{

    //PARA QUE FUNCIONE CON LA NUEVA FUNCION TENGO QUE CAMBIAR ID POR CODIGOBARRA

    getProductoDiabetex = async (codigoBarra) => {

        let returnEntity=null;

        console.log('Estoy en: ProductoSrvice.getProductoDiabetex(codigoBarra)');
        try{
        
            let pool= await sql.connect(config);
            
            let result = await pool.request()
                                .input('pCodigoBarra', sql.VarChar, codigoBarra)
                                .query('SELECT * FROM Producto WHERE codigoBarra=@pCodigoBarra')
            returnEntity=result.recordsets[0][0];
        
    } 
    catch(error) {
        console.log(error);
    }
    return returnEntity;
    }

    // TRAE EL PRODUCTO DE LA API EXTERNA Y LO AGREGA A LA BD

    getProduct = async(codebar) => {
        let Productodata;
        console.log('getProduct');
        let url = `http://world.openfoodfacts.org/api/v0/product/${codebar}.json?fields=product_name_es,quantity,brands,manufacturing_places,ingredients_text,ingredients_analysis_tags,nutrient_levels_tags,nutriments,ecoscore_data,selected_images`;
        console.log(url);
        let returnEntity=null;
        try{
            const result = await axios.get(url)
            Productodata = result.data;
            console.log(Productodata.status);

            //Cuando el status del producto es 0 significa que no existe

            if (Productodata.status!=0){
                
              console.log('Insertando producto de api externa en bd');
              
              console.log(Productodata.product.manufacturing_places);
              
              let pool= await sql.connect(config);
              let result = await pool.request()
                                
                                .input('pNombre',sql.VarChar, Productodata.product.product_name_es)
                                .input('pIngredientes',sql.VarChar, Productodata.product.ingredients_text)
                                .input('pCantidad',sql.VarChar, Productodata.product.quantity)
                                .input('PCantMeGusta',sql.Int, null)
                                .input('pMarca',sql.VarChar, Productodata.product.brands)
                                .input('pEspeciesAmenazadas',sql.Bit, Productodata.product.ecoscore_data.adjustments.threatened_species)
                                .input('pLugarFabricacion',sql.VarChar, Productodata.product.manufacturing_places)
                                .input('pHCAgricultura',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_agriculture)
                                .input('pHCProcesado',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_processing)
                                .input('pHCEmbalaje',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_packaging)
                                .input('pHCTransporte',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_transportation)
                                .input('pHCDistribución',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_distribution)
                                .input('pHCConsumo',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_consumption)
                                .input('pHCTotal',sql.Float, Productodata.product.ecoscore_data.agribalyse.co2_total)
                                .input('pNAlcohol100g',sql.Float, Productodata.product.nutriments.alcohol_100g)
                                .input('pNCarbohidratos100g',sql.Float, Productodata.product.nutriments.carbohydrates_100g)
                                .input('pNEnergia100g',sql.Float, Productodata.product.nutriments["energy-kcal_100g"])
                                .input('pNGrasa100g',sql.Float, Productodata.product.nutriments.fat_100g)
                                .input('pNFibra100g',sql.Float, Productodata.product.nutriments.fiber_100g)
                                .input('pNProteinas100g',sql.Float, Productodata.product.nutriments.proteins_100g)
                                .input('pNSal100g',sql.Float, Productodata.product.nutriments.salt_100g)
                                .input('pNGrasasSaturadas100g',sql.Float, Productodata.product.nutriments["saturated-fat_100g"])
                                .input('pNSodio100g',sql.Float, Productodata.product.nutriments.sodium_100g)
                                .input('pNAzucar100g',sql.Float, Productodata.product.nutriments.sugars_100g)
                                .input('pFoto',sql.VarChar, Productodata.product.selected_images.front.display.fr)
                                .input('pCodigoBarra',sql.VarChar, Productodata.code)
                                
                                .query("INSERT INTO Producto(Nombre,Ingredientes,Cantidad,CantMeGusta,Marca,EspeciesAmenazadas,LugarFabricacion,HCAgricultura,HCProcesado,HCEmbalaje,HCTransporte,HCDistribución,HCConsumo,HCTotal,NAlcohol100g,NCarbohidratos100g,NEnergia100g,NGrasa100g,NFibra100g,NProteinas100g,NSal100g,NGrasasSaturadas100g,NSodio100g,NAzucar100g,Foto,CodigoBarra) VALUES (@pNombre,@pIngredientes,@pCantidad,@pCantMeGusta,@pMarca,@pEspeciesAmenazadas,@pLugarFabricacion,@pHCAgricultura,@pHCProcesado,@pHCEmbalaje,@pHCTransporte,@pHCDistribución,@pHCConsumo,@pHCTotal,@pNAlcohol100g,@pNCarbohidratos100g,@pNEnergia100g,@pNGrasa100g,@pNFibra100g,@pNProteinas100g,@pNSal100g,@pNGrasasSaturadas100g,@pNSodio100g,@pNAzucar100g,@pFoto,@pCodigoBarra)");
                               
              
                returnEntity=result.rowsAffected;
                console.log(returnEntity);
                                
            } else {

              console.log('No se ha insertado ningun producto de la api externa en BD porque no existe');
            }
        }
        catch(error){
            console.log(error);
        }
        return Productodata;
    }
    
    //Trae todos los productos de BD
    getAll = async() => {

        let returnEntity = null;

        console.log('Estoy en: ProductoSrvice.GetAll');

        try{
            
            let pool= await sql.connect(config);
           
            let result = await pool.request().query("SELECT * FROM Producto")

            returnEntity = result.recordsets[0];

        } 
        catch(error) {
            console.log(error);
        }
        return returnEntity;
    }

    /*
    insertProducto = async (cuerpo) => {
        let returnEntity=null;
        console.log('Estoy en: ProductoSrvice.insert');
        try{
            let pool= await sql.connect(config);
            let result = await pool.request()
                                .input('pCodigoBarra',sql.VarChar, Productodata.code)
                                .input('pNombre',sql.VarChar, cuerpo.Nombre)
                                .query("INSERT INTO Producto(CodigoBarra,Nombre) VALUES (@pCodigoBarra,@pNombre)");
            returnEntity=result.rowsAffected;
        } 
        catch(error) {
            console.log(error);
        }
        return returnEntity;
    }
    */

}