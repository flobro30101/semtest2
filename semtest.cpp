#include <semaphore.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <time.h>

void semtest( int semnum, bool initmem )
{
        sem_t sem;

        if ( initmem )
        {
                memset( &sem, 0, sizeof( sem_t ) );
                printf( "sem %d: memset size = %d\n", semnum, sizeof( sem_t ) );
        }

        errno = 0;
        int res = sem_init( &sem, 0, 0 );

        printf( "sem %d: sem_init res = %d, errno = %d\n", semnum, res, errno );

        timespec ts;
        clock_gettime( CLOCK_REALTIME, &ts );
        ts.tv_sec += 1;

        errno = 0;
        res = sem_timedwait( &sem, &ts );

        printf( "sem %d: sem_timedwait res = %d, errno = %d\n\n", semnum, res, errno );
}

