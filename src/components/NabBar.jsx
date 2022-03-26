import { AppBar, Toolbar, Typography, Grid, Paper, InputBase, IconButton, Button, Badge, Card, MenuItem, ClickAwayListener } from '@mui/material';
// import React from 'react';
import { Link } from 'react-router-dom';
import SearchIcon from '@material-ui/icons/Search'
import React, { useState,useEffect } from "react";
import ShopingCartIcon from '@material-ui/icons/ShoppingCart'
import AccountCircleRoundedIcon from '@material-ui/icons/AccountCircleRounded';
import PersonIcon from '@mui/icons-material/Person';
import LogoutIcon from '@mui/icons-material/Logout';
import LocalMallIcon from '@mui/icons-material/LocalMall';
import { useStateValue } from '../state/stateProvider';
import axios from "axios";
import {domain,getheader} from "../env"
import ContactsIcon from '@mui/icons-material/Contacts';
import './Footer.css'


const NabBar = () => {

     const [{ profile }, dispatch] = useStateValue();
     const logoutnow = () => {
          window.localStorage.clear()
          window.location.href = '/';
        }


        const [cartItem, setCartItem] = useState(() => {
          const saved = localStorage.getItem("cart");
          // console.log('getcart', saved)
          const initialValue = JSON.parse(saved);
          return initialValue || "";
        });
     //    console.log('getcartitm i the cart', cartItem)

   


  console.log("NabBar===", profile);
     const [text, setText] = useState('')
     const [showMenu, setShowMenu] = useState(false)
     return (
          <div>
               <AppBar position='sticky' style={{ background: 'blue', height: '30px' }}>
                    <Toolbar style={{ background: 'blue' }}>

                         <Grid container>
                              <Link to={"/"} color="inherit" style={{ textDecoration: 'none', backgroundColor: 'gary' }}>
                                   <Typography style={{ color: 'white',paddingTop:'10PX' }}><span style={{color:'tomato'}}><LocalMallIcon/></span>eSHOP</Typography>
                              </Link>
                              <Paper style={{ margin: '0 20px' }}>
                                   <InputBase
                                        value={text}
                                        placeholder='Search Now...'
                                        style={{ padding: '10px' }}
                                        onChange={(e) => setText(e.target.value)} />

                                   <Link to={`/q-${text}`}>
                         
                                        <IconButton disabled={text.length <= 0 ? true : false}>
                                        <SearchIcon />
                                        </IconButton>

                                   </Link>


                              </Paper>
                         </Grid>
                    
                    {
                         profile === null?
                         <>
                         <Link to="/login" style={{textDecoration:'none'}}>
                         <Button   ><p style={{color:'white'}}>Login</p></Button>
                         </Link> 
                         </>
                         : 

                         <>
                         <Link to='/order' style={{textDecoration:'none'}}>


                         {/* <IconButton color='inherit' style={{ paddingLeft: '10px' }}>
                              <Badge badgeContent='3' color='secondary'>
                                   <ShopingCartIcon />
                              </Badge>
                         </IconButton> */}
                               {
                                   cartItem <= 0 ?  <IconButton color='inherit'   style={{ paddingLeft: '10px',color:'white' }} >
                                   <Badge badgeContent='1' color='secondary'>
                                        <ShopingCartIcon />
                                   </Badge>
                              </IconButton>:
                                   
                                     <IconButton color='inherit' title = "My Cart"  style={{ paddingLeft: '10px',color:'white' }} className='cart'>
                              <Badge badgeContent={cartItem.length} color='secondary'>
                                   <ShopingCartIcon />
                              </Badge>
                         </IconButton>
                                   
                              } 
                         </Link>
                       

                         <IconButton color='inherit'  title = "My Account" style={{ paddingRight: '10px',color:'white' }} onClick={() => setShowMenu(true)}>
                              <AccountCircleRoundedIcon />
                         </IconButton>

                         {
                              showMenu &&
                              <ClickAwayListener onClickAway={() => setShowMenu(false)}>
                                   <Card style={{
                                        position: 'fixed',
                                        width:'100px',
                                        top: '50px',
                                        right: '10px'
                                   }}>
                                        <Link to={`/profile-${profile?.username}`} style={{textDecoration:'none'}}>
                                        <MenuItem onClick={()=>setShowMenu(false)}><span><PersonIcon/></span><span>Profile</span></MenuItem>
                                        </Link>
                                       
                                       <br/>
                                       <br/>
                                       <MenuItem onClick={logoutnow}><span><LogoutIcon/></span><span>Logout</span></MenuItem>

                                   </Card>
                              </ClickAwayListener>

                         }

                        <Link to="/Contact">
                         <IconButton color='inherit' title = "Contact" style={{ paddingRight: '10px',color:'white' }} >
                              <ContactsIcon />
                         </IconButton>
                         
                         </Link>
                         
                         
                         </>

                    }



                         


                         
                         

                    </Toolbar>

               </AppBar>
          </div>
     );
};

export default NabBar;