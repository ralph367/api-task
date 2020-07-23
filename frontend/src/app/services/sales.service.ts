import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http'
import { Observable } from 'rxjs'

@Injectable({
  providedIn: 'root'
})
export class SalesService {
  private backEndUrl = 'http://127.0.0.1:8000/api/';

  constructor(private http: HttpClient) { }

  getAgents(): Observable<any>{
    return this.http.get(this.backEndUrl+"agents/")
  }

  postAgents(data): Observable<any>{
    return this.http.post(this.backEndUrl+"agents/", data)
  }
}
