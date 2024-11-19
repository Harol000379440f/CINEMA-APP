import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class SeatsService {
  private baseUrl = 'http://localhost:8081/api/seats';

  constructor(private http: HttpClient) {}

  getAvailableSeats(): Observable<any> {
    return this.http.get(`${this.baseUrl}/available`);
  }

  bookSeat(seatNumber: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/book/${seatNumber}`, {});
  }
}