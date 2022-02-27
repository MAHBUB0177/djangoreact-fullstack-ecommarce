import { AppBar, Toolbar, Typography, Grid, Paper, InputBase, IconButton, Button, Badge, Card, MenuItem, ClickAwayListener } from '@mui/material';
// import React from 'react';
import { Link } from 'react-router-dom';
import SearchIcon from '@material-ui/icons/Search'
import React, { useState } from "react";
import ShopingCartIcon from '@material-ui/icons/ShoppingCart'
import AccountCircleRoundedIcon from '@material-ui/icons/AccountCircleRounded';
import { useStateValue } from '../state/stateProvider';
import { WindowSharp } from '@mui/icons-material';



const NabBar = () => {

     const [{ profile }, { }] = useStateValue();

     const logoutnow = () => {
          window.localStorage.clear()
          window.location.href = '/';
        }

  console.log("NabBar===", profile);
     const [text, setText] = useState('')
     const [showMenu, setShowMenu] = useState(false)
     return (
          <div>
               <AppBar position='sticky' style={{ background: 'blue', height: '30px' }}>
                    <Toolbar style={{ background: 'blue' }}>

                         <Grid container>
                              <Link to={"/"} color="inherit" style={{ textDecoration: 'none', backgroundColor: 'gary' }}>
                                   <Typography style={{ color: 'black',paddingTop:'10PX' }}>eSHOP</Typography>
                              </Link>
                              <Paper style={{ margin: '0 20px' }}>
                                   <InputBase
                                        value={text}
                                        placeholder='Search Now...'
                                        style={{ padding: '10px' }}
                                        onChange={(e) => setText(e.target.value)} />

                                   <Link to={`/q-${text}`}>
                                        <IconButton
                                             disabled={text.length <= 0 ? true : false}>
                                             <SearchIcon />
                                        </IconButton>

                                   </Link>


                              </Paper>
                         </Grid>
                    
                    {
                         profile === null? <Link to="/login" style={{textDecoration:'none'}}>
                         <Button   ><p style={{color:'white'}}>Login</p></Button>
                         </Link> : 

                         <>
                         <Link to='/order' style={{textDecoration:'none'}}>
                         <IconButton color='inherit' style={{ paddingLeft: '10px' }}>
                              <Badge badgeContent='3' color='secondary'>
                                   <ShopingCartIcon />
                              </Badge>
                         </IconButton>
                         </Link>
                       

                         <IconButton color='inherit' style={{ paddingRight: '10px' }} onClick={() => setShowMenu(true)}>
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
                                        <Link to={`/profile-${profile?.username}`}>
                                        <MenuItem >Profile</MenuItem>
                                        </Link>
                                       
                                       <br/>
                                       <br/>
                                       <MenuItem onClick={logoutnow}>Logout</MenuItem>

                                   </Card>
                              </ClickAwayListener>

                         }
                         
                         
                         </>

                    }



                         


                         
                         

                    </Toolbar>

               </AppBar>
          </div>
     );
};

export default NabBar;