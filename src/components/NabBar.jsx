import { AppBar, Toolbar, Typography, Grid, Paper, InputBase, IconButton, Button, Badge, Card, MenuItem, ClickAwayListener, Drawer, Box } from '@mui/material';
// import React from 'react';
import { Link } from 'react-router-dom';
import SearchIcon from '@material-ui/icons/Search'
import React, { useState, useEffect } from "react";
import ShopingCartIcon from '@material-ui/icons/ShoppingCart'
import AccountCircleRoundedIcon from '@material-ui/icons/AccountCircleRounded';
import PersonIcon from '@mui/icons-material/Person';
import LogoutIcon from '@mui/icons-material/Logout';
import LocalMallIcon from '@mui/icons-material/LocalMall';
import { useStateValue } from '../state/stateProvider';
import axios from "axios";
import { domain, getheader } from "../env"
import ContactsIcon from '@mui/icons-material/Contacts';
import './Footer.css'
import DashboardIcon from '@mui/icons-material/Dashboard';


const NabBar = () => {
     const [over, setOver] = useState(false)
     const [isDrowerOpen, setisDrowerOpen] = useState(false)
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
                                   <Typography style={{ color: 'white', paddingTop: '10PX', paddingRight: '10PX', paddingLeft: '20px' }}><span style={{ color: 'tomato' }}><LocalMallIcon /></span>eSHOP</Typography>

                              </Link>
                              <Link to="/dashboard">
                                   <Typography style={{ color: 'white', paddingTop: '10PX' }}><span style={{ color: 'tomato' }}><DashboardIcon /></span>DashBoard</Typography>
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
                              profile === null ?
                                   <>
                                        <Link to="/login" style={{ textDecoration: 'none' }}>
                                             <Button   ><p style={{ color: 'white' }}>Login</p></Button>
                                        </Link>
                                   </>
                                   :

                                   <>
                                        {/* <Link to='/order' style={{ textDecoration: 'none' }}> */}


                                       
                                        {
                                             cartItem.length <= 0 ? <IconButton color='inherit' style={{ paddingLeft: '10px', color: 'white' }} onClick={() => setisDrowerOpen(true)}>
                                                  <Badge badgeContent='1' color='secondary'>
                                                       <ShopingCartIcon />
                                                  </Badge>
                                             </IconButton> :

                                                  <IconButton color='inherit' title="My Cart" style={{ paddingLeft: '10px', color: 'white' }} className='cart' onClick={() => setisDrowerOpen(true)}>
                                                       <Badge badgeContent={cartItem.length} color='secondary'>
                                                            <ShopingCartIcon />
                                                       </Badge>
                                                  </IconButton>

                                        }
                                        {/* </Link> */}


                                        <IconButton color='inherit' title="My Account" style={{ paddingRight: '10px', color: 'white' }} onMouseOver={() => setOver(true)}>
                                             <AccountCircleRoundedIcon />
                                        </IconButton>
                                        {/* onClick={() => setShowMenu(true)}
                         onMouseOver={()=>setOver(true)} */}

                                        {/* {
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

                         } */}



                                        {
                                             over &&
                                             <ClickAwayListener onClickAway={() => setOver(false)}>
                                                  <Card style={{
                                                       position: 'fixed',
                                                       width: '300px',
                                                       height: '300px',
                                                       top: '50px',
                                                       marginLeft: '1000px'
                                                  }} >
                                                       <p style={{ marginTop: '10px', marginLeft: '60px' }}>Get Started Now</p>
                                                       <strong><hr /></strong>
                                                       <Link to={`/profile-${profile?.username}`} style={{ textDecoration: 'none' }}>
                                                            <Button variant="contained" color="secondary" style={{ width: '200px', marginTop: '20px', marginLeft: '40px' }} onClick={() => setOver(false)}><span><PersonIcon /></span><span>Profile</span></Button>
                                                       </Link>
                                                       <Button variant="contained" color="info" style={{ width: '200px', marginTop: '20px', marginLeft: '40px' }} >Join Free</Button>
                                                       <Button variant="contained" color="primary" style={{ width: '200px', marginTop: '20px', marginLeft: '40px' }} onClick={logoutnow}><span><LogoutIcon /></span><span>Logout</span></Button>
                                                       <br />


                                                  </Card>
                                             </ClickAwayListener>


                                        }


                                        <Link to="/Contact">
                                             <IconButton color='inherit' title="Contact" style={{ paddingRight: '10px', color: 'white' }} >
                                                  <ContactsIcon />
                                             </IconButton>

                                        </Link>


                                   </>

                         }









                    </Toolbar>

               </AppBar>




               <Drawer anchor='right' open={isDrowerOpen}
                    onClose={() => setisDrowerOpen(false)}>
                    <Box p={2} width='400px' textAlign='center' role='presentation'>


                         <p style={{ textAlign: 'left' }}> Your Cart</p>
                         <hr />

                         <div style={{ height: '200px' }}>

                         </div>


                         <hr />
                         <p style={{ textAlign: 'left' }}>total</p>
                         <div style={{ display: 'flex' }}>
                              <div className='col-6'>
                                   <Link to='/order' style={{ textDecoration: 'none' }}>
                                        <Button variant="contained" class="btn btn-outline-info" style={{ width: '140px', marginTop: '20px' }} >View Cart</Button>
                                   </Link>
                              </div>

                              <div className='col-6'>
                                   <Button variant="contained" color="info" style={{ width: '160px', marginTop: '20px' }} >Checkout</Button>

                              </div>
                         </div>
                    </Box>

               </Drawer>
          </div>
     );
};

export default NabBar;