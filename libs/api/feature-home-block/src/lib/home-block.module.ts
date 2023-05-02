import { Module } from '@nestjs/common'
import { HomeBlockService } from './home-block.service'
import { HomeBlockResolver } from './home-block.resolver'
import { PrismaModule } from '@okkino/api/data-access-db'

@Module({
  providers: [HomeBlockResolver, HomeBlockService],
  imports: [PrismaModule]
})
export class HomeBlockModule {}
