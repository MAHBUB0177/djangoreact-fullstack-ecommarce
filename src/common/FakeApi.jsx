import axios from 'axios';
import React, { useEffect, useState } from 'react';

const FakeApi = () => {
  const [user,setUser]=useState([])
  const [email,setEmail]=useState('')
  console.log(email)
  const [username,setUsername]=useState('')
  const [userId,setUserId]=useState('')
  console.log(user)

  useEffect(()=>{
    getData()
  },[])
  const getData=async()=>{
    await axios({
      url:`https://fakestoreapi.com/users`,
      method:'GET'

    }).then(res=>
      setUser(res.data)
      )
  }

  const selectUser=(id)=>{
    console.warn(user[id - 1])
    let item=user[id-1];
    setEmail(item.email)
    setUsername(item.username)
    setUserId(item.id)
  

  }
  function updateuser(){
    console.log(username,email,userId,'update data in the forms')
    let item={username,email}
    console.warn("item",item)
    fetch(`https://fakestoreapi.com/users/${userId}`, {
      method: 'PUT',
      headers:{
        'Accept':'application/json',
        'Content-Type':'application/json'
      },
      body:JSON.stringify(item)
    }).then((result) => {
      result.json().then((resp) => {
        console.warn(resp)
        getData()
      })
    })

  }



  function createPDF() {
    console.log('mahbub alam')
    var divContents = document.getElementById('td').innerHTML;

    var style = "<style>";
    style = style + "table {width: 100%;font: 10px Calibri;}";
    style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
    style = style + "padding: 2px 3px;text-align: center;}";
    style = style + "</style>";

    // CREATE A WINDOW OBJECT.
    var win = window.open();
    win.document.write('<html><head>');
    win.document.write(style); // ADD STYLE INSIDE THE HEAD TAG.
    win.document.write('</head>');

    win.document.write('<body>');
    win.document.write(divContents); // THE TABLE CONTENTS INSIDE THE BODY TAG.
    win.document.write('</body></html>');

    win.document.close(); // CLOSE THE CURRENT WINDOW.

    win.print(); // PRINT THE CONTENTS.
}
  return (
    <div style={{display:'flex'}}>
      <div id='td'>

      
      <h2>this is a simple demop Api</h2>
      <table border='1px solid gray' >
        <thead>
          <tr>
            <td>id</td>
            <td>email</td>
            <td>username</td>
            <td>Action</td>
            
          </tr>
        </thead>
        <tbody>
          {
            user.map(item=>
              <tr>
            <td>{item.id}</td>
            <td>{item.email}</td>
            <td>{item.username}</td>
            <td><button onClick={()=>selectUser(item.id)}>update</button></td>
          </tr>
              )
          }
          
        </tbody>
      </table>
      <button style={{width:'200px'}} onClick={createPDF}>pdf create</button>
      </div>

<br></br>


      <div style={{marginTop:"30px"}}>
        <input type='text' value={email} onChange={(e)=>setEmail(e.target.value)}></input>
        <br></br>
        <input type='text' value={username} onChange={(e)=>setUsername(e.target.value)}></input>
        <br></br>
        <button onClick={updateuser}>update data</button>
      </div>

      
    </div>
  );
};

export default FakeApi;