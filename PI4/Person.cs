using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PI4
{
    public class Person
    {
        public static int p;
        public static int u;
        public static int c;
        public static int m;
        public void Persona(int d)
        {
            p = d;
        }
        public void User(int d)
        {
            u = d;
        }
        public void Carrera(int d)
        {
            c = d;
        }
        public void mensaje(int d)
        {
            m = d;
        }
    }
}