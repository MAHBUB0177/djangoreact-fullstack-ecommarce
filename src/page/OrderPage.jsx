import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { domain, getheader } from '../env';
import Cookies from 'js-cookie'
import { Button, Box } from '@material-ui/core';
import { Typography } from '@mui/material';
import Swal from 'sweetalert2'

import {Card} from 'react-bootstrap';



import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

const OrderPage = () => {

  const [cartItem, setCartItem] = useState(() => {
    const saved = localStorage.getItem("cart");
    console.log('getcart', saved)
    const initialValue = JSON.parse(saved);
    return initialValue || "";
  });
  console.log('check cart orderpage', cartItem)

  var total = 0;
  for (let i = 0; i < cartItem.length; i++) {
    var product = cartItem[i];
    total = total + product.price;
  }

  let shipping = 0;
  if (total > 2200) {
    shipping = 0
  }
  else if (total > 1500) {
    shipping = 4.99;
  }
  else if (total > 0) {
    shipping = 12.99;
  }

  const tax = total / 10;

  const formatNumber = (num) => {
    const precision = num.toFixed(2);
    return (Number(precision))
  }


const confirmOrder=()=>{
  Swal.fire({
    icon: 'success',
    title: 'Thank you',
    text: 'Your Order Is Confirmed !!!!',
    timer: 1200
    
  })
  // document.getElementById('order').reset()
  window.location.href='/'

}


const removeItem=(id)=>{
  console.log(id,'product id')
 const newCart= cartItem.filter(item=>item.id !== id)
 console.log(newCart)
setCartItem(newCart)
// const remv_cart=cartItem.filter(item=>item.id === id)
// window.localStorage.removeItem(remv_cart);

}

  return (
    <div className='  container col-md-12' style={{  marginTop: '30px' }} >
      <div class="col-12 col-lg-8 text-center">
                                <span class="dri dri-cart fa-2x bg-primary rounded-circle"></span>
                                <h2 class="mt-3">Shopping <font class="text-primary">Cart</font></h2>
                            </div>

    {/* // <div className='  container col-md-12' style={{ display: 'flex', marginTop: '30px' }} > */}
      {/* <div className='col-md-8' style={{ borderLft: '1px solid gray', borderRight: '1px solid black' }}>
        {
          cartItem?.map((item, i) =>
            <div class="card" style={{ width: '22rem', display: 'inline-block', marginRight: '10px', marginBottom: '20px' }}>
              <img src={item?.image} class="card-img-top" alt={item?.image} style={{height:'250px'}}></img>
              <div class="card-body">
                <h5 class="card-title" >{item?.title}</h5>
                <Typography>

                  {
                    item?.oldprice && (
                      <Box component="span" style={{
                        fontWeight: 'bold', fontSize: 'large', textDecoration: 'line-through',
                        color: 'red', padding: '5px'
                      }}>
                        {item?.oldprice}Tk
                      </Box>

                    )
                  }
                
                  <Box component='span' style={{
                    fontWeight: 'bold',
                    fontSize: 'large',
                    padding: '5px'
                  }} >
                    {item?.price}Tk
                  </Box>
                  
                </Typography>
                <button class='btn btn-danger' onClick={()=>removeItem(item?.id)}>Remove</button>
              </div>
            </div>


          )
        }
      </div>

      <div className=' container col-md-4' style={{ justifyContent: 'center' }} id ='order' >
        <h1 style={{
          justifyContent: 'center',
          borderBottom: '3px solid gray',
          color: 'red'
        }}>Order Summary</h1>
        <h4 style={{ color: 'tomato' }}>Items Order:{cartItem.length}</h4>
        <p><b>Product price:</b>{formatNumber(total)}</p>
        <p><b>Shipping Cost:</b>{formatNumber(shipping)}</p>
        <p><b>Tax & Vat:</b>{formatNumber(tax)}</p>
        <p><b>Total Price:</b> {formatNumber(total + shipping + tax)}</p>
{
        cartItem.length <= 0 ? " " : 
        <>
        <Button class="btn btn-info" style={{ textAlign: 'center' }} onClick={confirmOrder}>Confirm</Button>
        </>
}
      </div> */}




<div className="row col-12" style={{display:'flex'}}>
  <div className='col-md-7 col-lg-7'>
<TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>item</TableCell>
            <TableCell align="right">image</TableCell>
            <TableCell align="right">quantity</TableCell>
            <TableCell align="right">price</TableCell>
            <TableCell align="right">TotalPrice</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {cartItem.map((row) => (
            <TableRow
              key={row.name}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row.title}
              </TableCell>
              {/* <TableCell align="right">{row.image}</TableCell> */}
              <TableCell align="right"><img src={row.image} alt="" style={{ border: '3', height: '70px', width: '100px' }}></img></TableCell>
              <TableCell align="right">{row.price}</TableCell>
              <TableCell align="right">{row.price}</TableCell>
              <TableCell align="right">{row.carbs}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
    </div>

    <div className='col-md-5 col-lg-5'>
    <Card style={{ width: '25rem' }}>
  <Card.Body>
    <Card.Title>Card Title</Card.Title>
    <Card.Text>
      Some quick example text to build on the card title and make up the bulk of
      the card's content.
    </Card.Text>
    <Button variant="primary">Go somewhere</Button>
  </Card.Body>
</Card>

    </div>
    </div>

    </div>
  );
};

export default OrderPage;