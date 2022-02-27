import {
  Box,
  Button,
  Card,
  CardActionArea,
  CardActions,
  CardContent,
  CardMedia,
  Typography,
} from "@material-ui/core";
import React from "react";
import AddShoppingCartIcon from "@material-ui/icons/AddShoppingCart";
import { Link } from 'react-router-dom';

const SingleProduct = ({ product }) => {
 
  return (
    <Card>
      <Link to={`/product-${product.title}-${product.id}`} style={{textDecoration:'none'}}>
        <CardActionArea  >
          <CardMedia component="img" height="250" image={product?.image} />
        </CardActionArea>
      </Link>


      <Link to={`/product-${product.title}-${product.id}`}  style={{textDecoration:'none'}}>
        <CardActionArea >
          <CardContent>
            <Typography align="center" variant="h6">
              {product?.title}
            </Typography>
            <Typography align="center">
              {product?.oldprice && (
                <Box
                  component="span"
                  style={{
                    fontWeight: "bold",
                    fontSize: "large",
                    textDecoration: "line-through",
                    color: "red",
                    padding: "5px",
                  }}
                >
                  {product?.oldprice}TK
                </Box>
              )}
              <Box
                component="span"
                style={{
                  fontWeight: "bold",
                  fontSize: "large",
                  padding: "5px",
                }}
              >
                {product?.price}TK
              </Box>
            </Typography>
          </CardContent>
        </CardActionArea>
      </Link>

      <CardActions
        style={{
          justifyContent: "center",
        }}
      >
        <Button
          endIcon={<AddShoppingCartIcon />}
          variant="outlined"
          size="small"
          color="primary"
        >
          Add To Cart
        </Button>
      </CardActions>
    </Card>
  );
};

export default SingleProduct;