import DoubleArrowSharpIcon from "@material-ui/icons/DoubleArrowSharp";
import { Button, Grid } from '@mui/material';
import {  Typography } from '@material-ui/core';
import React, { useState, useEffect } from 'react';
import { Link } from "react-router-dom";
import Swal from 'sweetalert2'
import SingleProduct from './SingleProduct';

const AllProducts = ({ products, showall = false, category, categoryid }) => {

  const [cart, setCart] = useState([])
  console.log('minnnnn allll okkk',cart)
  
  const countProduct = (product) => {
    
    const newCart = [...cart, product];
    setCart(newCart)
    localStorage.setItem("cart", JSON.stringify(cart))

      Swal.fire({
      icon: 'success',
      title: 'Thank you',
      text: 'Your product Is Added SuccessFully To The Cart!!!!',
      timer: 1200
      
    })

  }

  return (
    <Grid container spacing={2} style={{ marginTop: '15px' }}>

      {products?.map((item, i) => (
        <>
          {
            showall ? (<Grid key={i} md={2} sm={4} item>
              <SingleProduct product={item}
                countProduct={countProduct} />
            </Grid>) : (
              <>
                {
                  i <= 10 && (<Grid key={i} md={2} sm={4} item>
                    <SingleProduct product={item}
                      countProduct={countProduct} />
                  </Grid>)
                }


              </>
            )
          }

        </>

      ))}


      {products?.length > 11 && !showall && (
        <Grid
          item
          md={2}
          sm={4}
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
          }}
        >

          <Link to={`/category-${category}-${categoryid}`} style={{ textDecoration: 'none' }} >
            <Button >
              <Typography>See More</Typography>
              <DoubleArrowSharpIcon />
            </Button>
          </Link>
        </Grid>
      )}

    </Grid>
  );
};

export default AllProducts;