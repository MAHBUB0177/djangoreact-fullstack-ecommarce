
import './App.css';
import {
 BrowserRouter as Router,
 Routes,
 Route,

} from "react-router-dom";
import Ok from './ok';
import { Container, Typography } from '@mui/material';
import NabBar from './components/NabBar';
import Sliders from './components/Slider';
// import CategoryProducts from './components/CategoryProducts';
import HomePage from './page/HomePage';
import SingleCategoryProducts from './page/SingleCategoryProducts';
import ProductDetails from './page/ProductDetails';
import SingleBrandsProducts from './page/SingleBrandsProducts';
import SearchResultPage from './page/SearchResultPage';
import AuthPage from './page/AuthPage';
// import CategorysName from './components/CategorysName';
import React, { useEffect } from "react";
import axios from "axios";
import {domain,getheader} from "./env"
import { useStateValue } from './state/stateProvider';
import OrderPage from './page/OrderPage'
import ProfilePage from './page/ProfilePage';
import Footer from './components/Footer';


function App() {
  const [{ profile }, dispatch] = useStateValue();

 

 useEffect(() => {
  const getprofile = async () => {
    await axios({
      url: `${domain}/api/profile/`,
      method: 'GET',
      headers: getheader
    }).then(response => {
      console.log('App=====', response.data);
      dispatch({
        type:'PRO',
        value:response.data
      })
     
    })
    .catch(error=>{
      dispatch({
        type:'PRO',
        value:null
      })
    })
    

   
  }
  getprofile()
}, [])
 return (
  <>

   <Router>
    <NabBar />
    <br></br>
    <Routes>
     <Route path="/app" element={<Ok />} />
     <Route path="/" element={<HomePage />} />
     <Route path="/product-:title-:id" element={<ProductDetails />} />
     <Route path="/category-:title-:id" element={< SingleCategoryProducts/>}/>
     <Route path="/brand-:title-:id" element={< SingleBrandsProducts/>}/>
     <Route path="/q-:q" element={< SearchResultPage/>}/>
     <Route path="/login" element={< AuthPage/>}/>
     
{
  profile !== null &&
  <>
  <Route path='/order' element ={<OrderPage />}/>
  <Route  path='/profile-:username' element={<ProfilePage/>}/>

  </>
}
<Route element={< AuthPage/>}/>

    </Routes>
  <Footer></Footer>
   </Router>
  </>
 );
}

export default App;