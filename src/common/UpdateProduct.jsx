import axios from "axios";
import React, { useEffect, useState } from "react";
import { domain,getheader } from "../env";
import Cookies from 'js-cookie'
import { Table } from 'reactstrap'

const UpdateProduct = () => {
  const [product, setProduct] = useState([])
  const [title, setTitle] = useState('')
  console.log(title)
  const [price, setPrice] = useState('')
  console.log(price)
  const [userId, setUserId] = useState('')
  console.log(userId)
  const [data, setData] = useState('')
  console.log(data)


  const [show, setShow] = useState(true)
  useEffect(() => {
    const updateProducts = async () => {
      await axios({
        url: `${domain}/api/apiallproduct/`,
        method: "GET",
      })
        .then((response) => {
          console.log(response.data, 'alam');
          setProduct(response.data);
        })
        .catch((error) => {
          console.log("CategoryProduct", error);
        });
    };
    updateProducts();
  }, []);


  const selectProduct = async (id) => {
    console.log('mahbub alam')
    console.log(id)
    await axios({
      url: `${domain}/api/singleproductapi/${id}/`,
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
      .then((response) => {
        //  console.log(response.data[0],'ramimmmm');
        //  setData(response.data[0]);
        let item = response.data[0];
        setTitle(item.title)
        setPrice(item.price)
        setUserId(item.id)
      })
      .catch((error) => {
        console.log("CategoryProduct", error);
      });
  };





  const updatProduct = async () => {
    console.log(title, price, userId, 'update data in the forms')
    await axios({
      url: `${domain}/api/singleproductupdateapiview/`,
      method: 'get',
      // headers: { "X-CSRFToken": Cookies.get("csrftoken") },
      headers: getheader,
      data: {
        title: title,
        price: price,
        userId: userId

      }
    }).then(res => {
      console.log(res.data, '111111')
    })
    window.location.reload(false);


  }

  return (
    <div >
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style={{ marginTop: '30px' }}>
        <div class="modal-dialog" style={{ marginTop: '30px' }}>
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Update Product Details</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <span> <label for="recipient-name" class="col-form-label">title:</label>
                    <input type='text' value={title} onChange={(e) => setTitle(e.target.value)}></input></span>
                </div>
                <div class="mb-3">
                  <span> <label for="message-text" class="col-form-label">price:</label>
                    <input type='text' value={price} onChange={(e) => setPrice(e.target.value)}></input></span>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

              <button type="button" class="btn btn-primary" onClick={updatProduct}>Update</button>
            </div>
          </div>
        </div>
      </div>
      <h1 style={{ textAlign: 'center', borderBottom: '3px solid gray' }}>product list</h1>
      <div>
        <Table striped bordered hover >
          <thead>
            <tr>
              <th>id</th>
              <th>title</th>
              <th>price</th>
              <th>image</th>
              <th>Action</th>
            </tr>
          </thead>

          <tbody>
            {
              product?.map(item =>
                <tr>
                  <td>{item.id}</td>
                  <td>{item.title}</td>
                  <td>{item.price}</td>
                  {/* <td style={{rowspan: '2', border:'3', height:'100', width:'100'}}>{item.image}</td> */}
                  <td ><img src={item.image} alt="" style={{ border: '3', height: '70px', width: '100px' }}></img></td>

                  <td> <button onClick={() => selectProduct(item.id)} type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Edit</button></td>
                </tr>
              )
            }
          </tbody>
        </Table>
      </div>


    </div>
  );
};

export default UpdateProduct;