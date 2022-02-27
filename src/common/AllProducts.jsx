import DoubleArrowSharpIcon from "@material-ui/icons/DoubleArrowSharp";
import { Button, Grid } from '@mui/material';
import { typography } from '@mui/system';
import React from 'react';
import { Link } from "react-router-dom";
import SingleProduct from './SingleProduct';

const AllProducts = ({ products, showall = false,category,categoryid }) => {

  return (
    <Grid container spacing={2} style={{marginTop:'15px'}}>

      {products?.map((item, i) => (
        <>
          {
            showall ? (<Grid key={i} md={2} sm={4} item>
              <SingleProduct product={item} />
            </Grid>) : (
              <>
                {
                  i <= 10 && (<Grid key={i} md={2} sm={4} item>
                    <SingleProduct product={item} />
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
         
         <Link to={`/category-${category}-${categoryid}`} style={{textDecoration:'none'}} >
            <Button >
              <typography>See More</typography>
              <DoubleArrowSharpIcon />
            </Button>
            </Link>
        </Grid>
      )}

    </Grid>
  );
};

export default AllProducts;