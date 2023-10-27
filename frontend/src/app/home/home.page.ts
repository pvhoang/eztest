import { Component } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { map, catchError, tap } from 'rxjs/operators';

// Set to run on EC2;
const apiUrl = 'http://localhost:8000/api';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [IonicModule],
})
export class HomePage {
  public value: string;

  constructor(
    private http: HttpClient,
  ) {
    this.value = 'empty'
  }

  migrate() {
    this.get('migrate');
  }

  seed() {
    this.get('seed');
  }

  viewAll() {
    this.get('viewAll');
  }

  view() {
    this.get('view/1');
  }

  insert() {
    let dat = { 'name': "hoang", 'email': "pvhoang940@gmail.com", 'password' : "12345" };
    this.post('insert', dat);
  }

  update() {
    let dat = { 'name': "hoang", 'email': "pvhoang940@gmail.com", 'password' : "12345" };
    this.put('update/1', dat);
  }

  remove() {
    this.delete('delete/1');
  }

  get(api: string) {
    let url = apiUrl + '/' + api;
    return this.http
      .get<any>(url)
      .toPromise()
      .then((data:any) => {
        // remove user from local storage to log user out
        // console.log('login - data: ', data);
        console.log('api: ' + api + ' - data: ', data);
        // this.value = data[0].name;
        return data;
      })
      .catch((err:any) => {
        console.log('api: ' + api + ' - error: ', err);
        return err;
      });
  }

  post(api: string, dat: any) {
    let url = apiUrl + '/' + api;
    
    console.log('api: ' + api + ' - url: ', url);

    return this.http
      .post<any>(url, dat)
      .toPromise()
      .then((data:any) => {
        // remove user from local storage to log user out
        // console.log('login - data: ', data);
        console.log('api: ' + api + ' - data: ', data);
        // this.value = data[0].name;
        return data;
      })
      .catch((err:any) => {
        console.log('api: ' + api + ' - error: ', err);
        return err;
      });
  }

  put(api: string, dat: any) {
    let url = apiUrl + '/' + api;
    return this.http
      .put<any>(url, dat)
      .toPromise()
      .then((data:any) => {
        // remove user from local storage to log user out
        // console.log('login - data: ', data);
        console.log('api: ' + api + ' - data: ', data);
        // this.value = data[0].name;
        return data;
      })
      .catch((err:any) => {
        console.log('api: ' + api + ' - error: ', err);
        return err;
      });
  }

  delete(api: string) {
    let url = apiUrl + '/' + api;
    return this.http
      .delete<any>(url)
      .toPromise()
      .then((data:any) => {
        // remove user from local storage to log user out
        // console.log('login - data: ', data);
        console.log('api: ' + api + ' - data: ', data);
        // this.value = data[0].name;
        return data;
      })
      .catch((err:any) => {
        console.log('api: ' + api + ' - error: ', err);
        return err;
      });
  }

  
}
